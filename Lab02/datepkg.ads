--Lab 02
--datepkg.ads
package datepkg is 

	type MonthName is (January, February, March, April, May, June, July, August, September, 
						October, November, December);

	type DateType is record
		month: MonthName;
		day: integer range 1..31;
		year: integer range 1400.2020;
	end record;

end datepkg;