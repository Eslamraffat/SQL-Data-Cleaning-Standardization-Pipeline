IF OBJECT_ID('my_file_cleaned', 'U') IS NOT NULL
    DROP TABLE my_file_cleaned;
GO
CREATE TABLE my_file_cleaned (
    rank_1 tinyint,
    artist nVARCHAR(50),
    shows smallint,
    year_s nvarchar(50),
    clean_peak VARCHAR(50),
    clean_atp VARCHAR(50),
    clean_ref VARCHAR(255),
    cleaned_tour_title VARCHAR(255),
    clean_actual_gross VARCHAR(255),
    actual_gross_money MONEY,
    Adjusted_gross_in_2022 MONEY,
    adjust_amount MONEY
);