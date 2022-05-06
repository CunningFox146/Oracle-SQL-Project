CREATE OR REPLACE PACKAGE Crypto AS
    SecretKey CONSTANT VARCHAR(20) := 'SecretKey2281488';

    FUNCTION Encode (p_in_val IN VARCHAR2, p_key IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION Decode (p_in_val IN VARCHAR2, p_key IN VARCHAR2) RETURN VARCHAR2;
END;

CREATE OR REPLACE PACKAGE BODY Crypto AS
    FUNCTION Encode (p_in_val IN VARCHAR2, p_key IN VARCHAR2)
    RETURN VARCHAR2
    IS
        l_mod NUMBER := DBMS_CRYPTO.encrypt_aes128
                    + DBMS_CRYPTO.chain_cbc
                    + DBMS_CRYPTO.pad_pkcs5;

        l_enc RAW (2000);
    BEGIN
        l_enc := DBMS_CRYPTO.encrypt (
            utl_i18n.string_to_raw (p_in_val, 'AL32UTF8'),
            l_mod,
            utl_i18n.string_to_raw (p_key, 'AL32UTF8')
        );

       return RAWTOHEX (l_enc);
    END;

    FUNCTION Decode (p_in_val IN VARCHAR2, p_key IN VARCHAR2)
    RETURN VARCHAR2
    IS
        l_mod NUMBER := DBMS_CRYPTO.encrypt_aes128
                    + DBMS_CRYPTO.chain_cbc
                    + DBMS_CRYPTO.pad_pkcs5;
        l_dec RAW (2000);
    BEGIN
        l_dec := DBMS_CRYPTO.decrypt (
            HEXTORAW (p_in_val),
            l_mod,
            utl_i18n.string_to_raw (p_key, 'AL32UTF8')
        );

        return utl_i18n.raw_to_char (l_dec);
    END;
END;

CREATE OR REPLACE TRIGGER ClientUpdateCryptoTrigger
BEFORE UPDATE OR INSERT ON Clients
FOR EACH ROW
BEGIN
    :NEW.Password := Crypto.Encode(:NEW.Password, Crypto.SecretKey);
END;