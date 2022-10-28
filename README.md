# <center> Data And Applications
# <center> Homework - 3

### <div style="text-align: right"> Abhinav Reddy Boddu
#### <div style="text-align: right"> 2021101034
### <div style="text-align: right"> Rohit Gowlapalli
#### <div style="text-align: right"> 2021101113
### <div style="text-align: right"> Gnana Prakash Punnavajhala
#### <div style="text-align: right"> 2021111027

<hr>

## `Note:` All the below Are single line (No nested Queries) commands Written in multiple lines just for readability of user.

## <ins>Query 1</ins>:

- Which Track Has Longest Length?

    ```sql
    SELECT * 
    FROM Track 
    ORDER BY Milliseconds DESC 
    LIMIT 1;
    ```
    (or)
    ```sql
    SELECT * 
    FROM Track 
    WHERE Milliseconds = ( 
        SELECT MAX(Milliseconds) 
        FROM Track
    );
    ```

    `Approach 1`:
    * Select everything from Track
    * arrange in descending order of milliseconds
    * limit the output to 1 row , i.e the first row (i.e having highest milliseconds)

    `Approach 2`:
    * Select maximum milliseconds from track
    * print all rows of table Track where milliseconds is = maximum 
    
    <br>

    <img src="Images/1.png"></img>

<hr>

## <ins>Query 2</ins>:

- How many audio tracks were listened to by the people of "Indian" nationality?
    ```sql
    SELECT COUNT(DISTINCT TrackID) AS Count 
    FROM Listener AS A,
        	ListeningTo AS B 
    WHERE Nationality='Indian' 
        	AND A.ListenerID=B.ListenerID;
    ```

    `Approach`:
    * select only Nationality=Indian From Listener table
    * use brint ListeningTo table with ListenerID as a Foreign key
    * Count the Number of distinct track

    <br>

    <img src="Images/2.png"></img>

<hr>

## <ins>Query 3</ins>:

- Which album takes up the maximum space?
    ```sql
    SELECT A.*, 
            SUM(Bytes) AS Size 
    FROM Album AS A,
            Track AS T 
    WHERE A.AlbumID=T.AlbumID 
    GROUP BY A.AlbumID 
    ORDER BY Size DESC 
    LIMIT 1;
    ```

    `Approach`:
    * Select Tables Album And Track with AlbumID as foreign key.
    * Group by AlbumID and Calculate the SUM of Bytes of a given album
    * order by descending order of sum of bytes.
    * limit the result to 1 to get the album of highest bytes

    <br>

    <img src="Images/3.png"></img>

<hr>

## <ins>Query 4</ins>:

- Which nationality listens to music the least?
    ```sql
    SELECT L.Nationality 
    FROM Listener AS L, 
            ListeningTo AS LT 
    WHERE L.ListenerID=LT.ListenerID 
    GROUP BY L.Nationality 
    ORDER BY SUM(LT.Milliseconds) ASC 
    LIMIT 1;
    ```

    `Approach`:
    * Select Listener and ListeningTo using ListenerID as Foreign key
    * group By nationality
    * Order by the sum of "Time" for a given nationality
    * limit the result to 1 to get the nationality of lowest time.

    <br>

    <img src="Images/4.png"></img>

<hr>

## <ins>Query 5</ins>:

- Which genre is listened to by the most people among "Americans"?
    ```sql
    SELECT G.* 
    FROM Genre AS G, 
            Track AS T, 
            ListeningTo AS LT, 
            Listener AS L 
    WHERE L.Nationality='American' 
            AND L.ListenerID=LT.ListenerID 
            AND LT.TrackID=T.TrackID 
            AND T.GenreID=G.GenreID 
    GROUP BY G.GenreID 
    ORDER BY COUNT(*) DESC 
    LIMIT 1;
    ```

    `Approach`:
    * Select * from Genre , Track , ListeningTo , Listener using Nationality, ListenerID,TrackID,GenreID as foreign keys.
    * group by GenreID 
    * order by the no of times the genre is appearing in the table (descending)
    * limit to 1 , to get the most appeared genre
    <img src="Images/5.png"></img>

<hr>

## <ins>Query 6</ins>:

- Which artist did not make any albums at all?
    ```sql
    SELECT A.Name 
    FROM Artist AS A 
    LEFT JOIN Track AS T 
            ON A.ArtistID=T.ArtistID 
    GROUP BY A.Name 
            HAVING COUNT(T.ArtistID) = 0;
    ```

    `Approach`:
    * select everything from Artist, Track using ArtistID as foreign key ( mandating every artist to appear using left join).
    * group by the artist
    * and print only artist having their count=0

    <br>
    <img src="Images/6.png"></img>

<hr>

## <ins>Query 7</ins>:

- Which artists did not record any tracks of the "Pop" Genre type?
    ```sql
    SELECT A.Name 
    FROM Artist AS A 
    LEFT JOIN Genre AS G LEFT JOIN Track AS T 
            ON T.GenreID=G.GenreID AND G.Name='Pop' ON A.ArtistID=T.ArtistID 
    GROUP BY A.Name 
            HAVING COUNT(T.ArtistID) = 0;
    ```

    <img src="Images/7.png"></img>

<hr>