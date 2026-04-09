
INSERT INTO my_file_cleaned
SELECT
    rank_1,
    artist,
    shows,
    year_s,
    COALESCE(REPLACE(REPLACE(peak, '[', ''), ']', ''), '0') AS clean_peak,
    COALESCE(REPLACE(REPLACE(all_time_peak, '[', ''), ']', ''), '0') AS clean_atp,
    REPLACE(REPLACE(ref, '[', ''), ']', '') AS clean_ref,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(actual_gross, ']', ''),
                '[', ''),
            'b', ''),
        'a', ''),
    'e', '') AS clean_actual_gross,
    TRIM(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(tour_title, '†', ''),
                '‡[4][a]', ''),
            '‡[21][a]', ''),
        '*', '')
    ) AS cleaned_tour_title,
    COALESCE(
        TRY_CONVERT(
            MONEY,
            NULLIF(REPLACE(REPLACE(actual_gross, '[', ''), ']', ''), '')
        ),
        0
    ) AS actual_gross_money,
    Adjusted_gross_in_2022,
    Adjusted_gross_in_2022 -
        COALESCE(
            TRY_CONVERT(
                MONEY,
                NULLIF(REPLACE(REPLACE(actual_gross, '[', ''), ']', ''), '')
            ),
            0
        ) AS adjust_amount
FROM my_file;