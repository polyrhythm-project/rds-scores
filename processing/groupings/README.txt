Groupings insertion processing
Craig Stuart Sapp
Tue Dec 17 21:48:53 PST 2019
================

This directory contains the grouping information and a script to insert groupings into
the kern data files.  The groupings.txt file comes from this spreadsheet:

https://docs.google.com/spreadsheets/d/1TPr7gGCknmwfPz__2uCeYw4wIr4uRvIV/edit#gid=2076862089

However, the score may be edited to allow changing of the groupings within parts, so the
proper placed to make updates to the groupings is in the kern files directly.  From the kern
files, the most up-to-date grouping information can be extracted, including information 
about changes in the groupings within a part/staff.

There are four columns that are expected in any order:

(1) 	Example		== This is the example number, without a prefix letter.
(2) 	Parts		== This is the number of staves in the score (check before processing)
(3)	Group A		== These are the staff numbers (indexed from lowest being 1) in group A
(4)	Group B		== These are the staff numbers in grooup B.


For Group A, the text "*grp:A" is added immediately after the **kern lines.  For Group B,
the text "*grp:B" is added at the same position.




