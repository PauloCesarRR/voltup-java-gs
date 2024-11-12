-- TB_USER table
CREATE TABLE TB_USER (
    ID RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
    FIRST_NAME VARCHAR2(255),
    LAST_NAME VARCHAR2(255),
    EMAIL VARCHAR2(255) UNIQUE NOT NULL,
    PASSWORD VARCHAR2(255) NOT NULL,
    TYPE VARCHAR2(255),
    CREATED_AT TIMESTAMP NOT NULL,
    UPDATED_AT TIMESTAMP NOT NULL,
    DELETED_AT TIMESTAMP
);

-- TB_FARM table
CREATE TABLE TB_FARM (
    ID RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
    NAME VARCHAR2(255),
    ACRE NUMBER,
    USER_ID RAW(16),
    FOREIGN KEY (USER_ID) REFERENCES TB_USER(ID)
);

-- TB_STRATEGY table
CREATE TABLE TB_STRATEGY (
    ID RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
    STRATEGY_NAME VARCHAR2(255),
    DESCRIPTION VARCHAR2(255)
);

-- TB_PLANTATION table
CREATE TABLE TB_PLANTATION (
    ID RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
    DATE DATE,
    PLANT_TYPE VARCHAR2(255),
    STRATEGY_ID RAW(16),
    FARM_ID RAW(16),
    FOREIGN KEY (STRATEGY_ID) REFERENCES TB_STRATEGY(ID),
    FOREIGN KEY (FARM_ID) REFERENCES TB_FARM(ID)
);