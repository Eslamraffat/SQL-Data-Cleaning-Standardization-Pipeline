--A Column rank: Checking primary key is not null/duplicate: PASSED
SELECT rank
FROM my_file
WHERE rank IS NULL OR rank <1

--B Column shows: Checking any unwanted spaces: PASSED
SELECT
	shows
FROM my_file
WHERE TRIM(CAST(shows AS NVARCHAR (50))) != CAST(shows AS NVARCHAR (50))

--C Check the consistency of values: CLEANED
	-- Column peak: removing '[]' & changeing nulls to 0
	SELECT
		COALESCE(
			REPLACE(REPLACE(PEAK, '[', ''), ']', ''),
        '0'
	 ) AS clean_peak
	 FROM my_file;

	-- Column all_time_peak: removing '[]' & changeing nulls to 0
	 SELECT
		COALESCE(
		   REPLACE(REPLACE(all_time_peak, '[', ''), ']', ''),
		   '0'
		) AS  clean_atp
	FROM my_file;

	-- Column ref: removing '[]'
	SELECT
		REPLACE(REPLACE(ref,'[',''),']','') as clean_ref
	FROM my_file;

	-- Column actual_gross: removing '[],b,a,e'
	SELECT
	REPLACE(
		REPLACE(
			REPLACE(
				REPLACE(
					REPLACE(actual_gross,']',''),
				'[',''),
			'b',''),
		'a',''),
	'e','') as clean_actual_gross
	FROM my_file;

	-- column tour_title: removing '†,‡,[4],[a],‡,[21],[a],*'
	SELECT *,
		TRIM(REPLACE(REPLACE(REPLACE(REPLACE(tour_title,'†',''),'‡[4][a]',''),'‡[21][a]',''),'*','')) AS cleaned_tour_title
	FROM my_file;
	
--D adding new calculated column: adjust_amount column (Adjusted_gross_in_2022 - actual_gross)
	UPDATE my_file
		SET actual_gross =
			COALESCE(
				TRY_CONVERT(
					MONEY,
					NULLIF(REPLACE(REPLACE(actual_gross, '[', ''), ']', ''), '')
				),
			   0
			 )

	SELECT
		actual_gross,
		Adjusted_gross_in_2022,
		Adjusted_gross_in_2022 - actual_gross as adjsut_amount
	FROM my_file;
