import subprocess as sp
import pymysql
import pymysql.cursors

def playerInsert():
    try:
        playerDetails = {}
        print("Enter the details of the player:")
        playerDetails["Base_price"] = int(input("Base price: "))
        playerDetails["Auctioned_price"] = int(input("Auctioned price: "))
        playerDetails["Name"] = input("Full name: ")
        playerDetails["CName"] = input("Captain name: ")
        playerDetails["Fantasy_points"] = int(input("Fantasy points: "))

        query = "INSERT INTO PLAYER(Base_price, Auctioned_price, Name, CName, Fantasy_points) VALUES(%d, %d, '%s', '%s', %d)" % (
            playerDetails["Base_price"], playerDetails["Auctioned_price"], playerDetails["Name"], playerDetails["CName"], playerDetails["Fantasy_points"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted player details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def playerUpdate():
    try:
        playerDetails = {}
        print("Enter the new details of the player:")
        playerDetails["Base_price"] = int(input("Base price: "))
        playerDetails["Auctioned_price"] = int(input("Auctioned price: "))
        playerDetails["CName"] = input("Captain name: ")
        playerDetails["Fantasy_points"] = int(input("Fantasy points: "))
        pname = input("Full name: ")

        query = "UPDATE PLAYER SET Base_price = %d, Auctioned_price = %d, CName = '%s', Fantasy_points = %d WHERE Name='{pname}'" % (
            playerDetails["Base_price"], playerDetails["Auctioned_price"], pname, playerDetails["CName"], playerDetails["Fantasy_points"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Update success")
    
    except Exception as e:
        con.rollback()
        print("Failed Update")
        print(">>>>>>>>>>>>>", e)

    return

def playerSearch():
    try:
        print("Searching By Player:")
        pname = input("Enter Player Name")
        query = "SELECT * FROM PLAYER WHERE Name='{pname}'"

        print(query)
        cur.execute(query)
        con.commit()
    
    except Exception as e:
        con.rollback()
        print("Failed Search")
        print(">>>>>>>>>>>>>", e)

def playerSort():
    try:
        print("Sorting By Player:")
        query = "SELECT * FROM PLAYER ORDER BY Fantasy_points DESC"

        print(query)
        cur.execute(query)
        con.commit()
    
    except Exception as e:
        con.rollback()
        print("Failed Sort")
        print(">>>>>>>>>>>>>", e)
        
def formInsert():
    try:
        formDetails = {}
        print("Enter fantasy points and corresponding form values:")
        formDetails["Fantasy_points"] = int(input("Fantasy points: "))
        formDetails["Form"] = int(input("Corresponding form value: "))

        query = "INSERT INTO FORM(Fantasy_points, Form) VALUES(%d, %d)" % (
            formDetails["Fantasy_points"], formDetails["Form"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted fanatasy points and form details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def teamInsert():
    try:
        teamDetails = {}
        print("Enter the details of the team:")
        teamDetails["Place"] = input("Home town: ")
        teamDetails["RTM_Cards"] = int(input("Number of RTM Cards: "))
        teamDetails["Money_Left"] = int(input("Money Left: "))
        teamDetails["Brand_Value"] = int(input("Brand Value: "))
        teamDetails["Fair_play_points"] = float(input("Fair play points: "))
        teamDetails["Total_points"] = int(input("Total points: "))
        teamDetails["Name"] = input("Team name: ")
        teamDetails["Coach"] = input("Coach name: ")

        query = "INSERT INTO TEAM(Place, RTM_Cards, Money_Left, Brand_Value, Fair_play_points, Total_points, Name, Coach) VALUES('%s', %d, %d, %d, %f, %d, '%s', '%s')" % (
            teamDetails["Place"], teamDetails["RTM_Cards"], teamDetails["Money_Left"], teamDetails["Brand_Value"], teamDetails["Fair_play_points"], teamDetails["Total_points"], teamDetails["Name"], teamDetails["Coach"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted team details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def teamUpdate():
    try:
        teamDetails = {}
        print("Enter the new details of the team:")
        teamPlace = input("Home town: ")
        teamCards = int(input("Number of RTM Cards: "))
        teamMoneyLeft = int(input("Money Left: "))
        teamBrandValue = int(input("Brand Value: "))
        teamFairPlayPoints = float(input("Fair play points: "))
        teamTotalPoints = int(input("Total points: "))
        tname = input("Team name: ")
        teamCoach = input("Coach name: ")

        query = "UPDATE TEAM SET Place = {teamPlace}, RTM_Cards = {teamCards}, Money_Left = {teamMoneyLeft}, Brand_Value = {teamBrandValue}, Fair_play_points = {teamBrandValue}, Total_points = {teamTotalPoints}, Coach = {teamCoach} WHERE Name = {tname}"

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted team details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return
    
def teamSort():
    try:
        query = "SELECT * FROM TEAM GROUP BY Name ORDER BY Total_points"
        print(query)
        cur.execute(query)
        con.commit()

        print("List of teams")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    
def teamMgrInsert():
    try:
        teamMgrDetails = {}
        print("Enter the details of the team manager:")
        teamMgrDetails["Manager_First_Name"] = input("First name of the manager: ")
        teamMgrDetails["Manager_Last_Name"] = input("Last name of the manager: ")
        teamMgrDetails["Name"] = input("Name of the partner the person is manager of: ")

        query = "INSERT INTO TEAM_MANAGER(Manager_First_Name, Manager_Last_Name, Name) VALUES('%s', '%s', '%s')" % (
            teamMgrDetails["Manager_First_Name"], teamMgrDetails["Manager_Last_Name"], teamMgrDetails["Name"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted team manager details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def teamMgrUpdate():
    try:
        teamMgrDetails = {}
        print("Enter the details of the team manager:")
        teamMgrDetails["Manager_First_Name"] = input("First name of the manager: ")
        teamMgrDetails["Manager_Last_Name"] = input("Last name of the manager: ")
        teamMgrDetails["Name"] = input("Name of the partner the person is manager of: ")

        query = "UPDATE TEAM_MANAGER SET Manager_First_Name = '%s', Manager_Last_Name = '%s' WHERE Name = '%s'" % (
            teamMgrDetails["Manager_First_Name"], teamMgrDetails["Manager_Last_Name"], teamMgrDetails["Name"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated team manager details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def leagueInsert():
    try:
        leagueDetails = {}
        print("Enter the details of the league:")
        leagueDetails["Prize_Money"] = int(input("Prize pool: "))
        leagueDetails["Runner_Up"] = input("Runner up of the tournament: ")
        leagueDetails["Winner"] = input("Winner of the tournament: ")
        leagueDetails["Name"] = input("League name: ")
        leagueDetails["Season_Number"] = int(input("Season number: "))

        query = "INSERT INTO PLAYER(Prize_Money, Runner_Up, Winner, Name, Season_Number) VALUES(%d, '%s', '%s', '%s', %d)" % (
            leagueDetails["Prize_Money"], leagueDetails["Runner_Up"], leagueDetails["Winner"], leagueDetails["Name"], leagueDetails["Season_Number"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted league details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureInsert():
    try:
        fixtureDetails = {}
        print("Enter the details of the fixture:")
        fixtureDetails["Date_Time"] = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        fixtureDetails["Venue"] = input("Scheduled venue of fixture: ")
        fixtureDetails["Match_No"] = int(input("Match number: "))

        query = "INSERT INTO FIXTURE(Date_Time, Venue, Result, Match_No) VALUES('%s', '%s', NULL, %d)" % (
            fixtureDetails["Date_Time"], fixtureDetails["Venue"], fixtureDetails["Match_No"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted fixture details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureUpdate():
    try:
        fixtureDetails = {}
        print("Enter the new details of the fixture:")
        fixtureDetails["Date_Time"] = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        fixtureDetails["Venue"] = input("Scheduled venue of fixture: ")
        fixtureDetails["Result"] = input("Winner:")

        query = "UPDATE FIXTURE SET Result = '%s' WHERE Date_Time='%s' AND Venue = '%s'" % (
            fixtureDetails["Result"], fixtureDetails["Date_Time"], fixtureDetails["Venue"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted fixture details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureDelete():
    try:
        fixtureDetails = {}
        print("Enter the details of the fixture:")
        Date_Time = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        Venue = input("Scheduled venue of fixture: ")

        query = "DELETE FROM FIXTURE WHERE Date_Time = '{Date_Time}' AND Venue = '{Venue}'"
        print(query)
        cur.execute(query)
        con.commit()

        print("Match removed sucessfully")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureSearch():
    try:
        print("Enter the details of the fixture:")
        Date_Time = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        Venue = input("Scheduled venue of fixture: ")

        query = "SELECT * FROM FIXTURE WHERE Date_Time = '{Date_Time}' AND Venue = '{Venue}'"

        print(query)
        cur.execute(query)
        con.commit()

        print("Found fixture")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def commentatorInsert():
    try:
        commentatorDetails = {}
        print("Enter the details of the commentator:")
        commentatorDetails["Date_Time"] = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        commentatorDetails["Venue"] = input("Scheduled venue of fixture: ")
        commentatorDetails["Commentators"] = input("Commentator Name: ")

        query = "INSERT INTO COMMENTATORS(Date_Time, Venue, Commentators) VALUES('%s', '%s', '%s')" % (
            commentatorDetails["Date_Time"], commentatorDetails["Venue"], commentatorDetails["Commentators"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted commentator details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def umpireInsert():
    try:
        umpireDetails = {}
        print("Enter the details of the umpire:")
        umpireDetails["Date_Time"] = input("Provide time in 'yyyy-mm-dd HH:MM:SS' (without the '') format: ")
        umpireDetails["Venue"] = input("Scheduled venue of fixture: ")
        umpireDetails["Umpire_Name"] = input("Name of the umpire: ")
        umpireDetails["Umpire_Position"] = int(input("Position of the umpire (For example, 3 for 3rd umpire): "))

        query = "INSERT INTO UMPIRE(Date_Time, Venue, Umpire_Name, Umpire_Position) VALUES('%s', '%s', '%s', %d)" % (
            umpireDetails["Date_Time"], umpireDetails["Venue"], umpireDetails["Umpire_Name"], umpireDetails["Umpire_Position"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted umpire details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def partnerFind():
    try:
        print("Enter the details of the League:")
        leagueNum = int(input("enter league Number:"))

        query = "SELECT Name FROM SPONSORS_LEAGUE AS S, PARTNER AS P WHERE S.CIN = P.CIN AND S.Number = {leagueNum}"

        print(query)
        cur.execute(query)
        con.commit()

        print("Success")
    
    except Exception as e:
        con.rollback()
        print("error")
        print(">>>>>>>>>>>>>", e)

    return

def partnerInsert():
    try:
        partnerDetails = {}
        print("Enter the details of the partners:")
        partnerDetails["CIN"] = int(input("CIN - Company Identification Number of the partner: "))
        partnerDetails["Name"] = input("Name of the partner company: ")

        query = "INSERT INTO PARTNER(CIN, Name) VALUES(%d, '%s')" % (
            partnerDetails["CIN"], partnerDetails["Name"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted partner details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def partnerTypeInsert():
    try:
        partnerTypeDetails = {}
        print("Enter the details of the partner type:")
        partnerTypeDetails["CIN"] = int(input("CIN - Company Identification Number of the partner: "))
        partnerTypeDetails["Type"] = input("Type of the partnership: ")

        query = "INSERT INTO PARTNER_TYPE(CIN, Type) VALUES(%d, '%s')" % (
            partnerTypeDetails["CIN"], partnerTypeDetails["Type"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted partner type details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def jerseyInsert():
    try:
        jerseyDetails = {}
        print("Enter the details of the jersey:")
        jerseyDetails["Jersey_Number"] = int(input("Jersey Number: "))
        jerseyDetails["BELONGS_TO"] = input("Team to which the jersey belongs to: ")

        query = "INSERT INTO JERSEY(Jersey_Number, BELONGS_TO) VALUES(%d, '%s')" % (
            jerseyDetails["Jersey_Number"], jerseyDetails["BELONGS_TO"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted partner type details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def awardInsert():
    try:
        awardDetails = {}
        print("Enter the details of the award:")
        awardDetails["Prize_Money"] = int(input("Prize money of the award: "))
        awardDetails["Name"] = input("Name of the award: ")
        awardDetails["AWARDED_IN"] = int(input("The season number in which the award was presented: "))
        awardDetails["AWARDED_TO"] = input("The name of the player to which the award was given to: ")

        query = "INSERT INTO AWARDS(Prize_Money, Name, AWARDED_IN, AWARDED_TO) VALUES(%d, '%s', %d, '%s')" % (
            awardDetails["Prize_Money"], awardDetails["Name"], awardDetails["AWARDED_IN"], awardDetails["AWARDED_TO"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted award details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def playerSponsorInsert():
    try:
        print("Enter the Sponsor, and which league they are sponsoring to:")
        pcin = int(input("Enter CIN of sponsor: "))
        player = input("Whom is {pcin} sponsoring to?")

        query = "INSERT INTO SPONSORS_PLAYER VALUES('{player}',{pcin})"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted partner type details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def playerSponsorDelete():
    try:
        print("Enter the Sponsor, and which player they are sponsoring to:")
        pcin = int(input("Enter CIN of sponsor: "))
        player = input("Whom is {pcin} sponsoring to?")

        query = "DELETE FROM SPONSORS_PLAYER WHERE Name='{player}' AND CIN={pcin}"
        print(query)
        cur.execute(query)
        con.commit()

        print("deleted Succesfull")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
        
def teamSponsorInsert():
    try:
        print("Enter the Sponsor, and which team they are sponsoring to:")
        pcin = int(input("Enter CIN of sponsor: "))
        leaguesno = int(input("Which League is {pcin} sponsoring to?"))

        query = "INSERT INTO SPONSORS_LEAGUE VALUES({leaguesno},{pcin})"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted sponsor details of the league into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete")
        print(">>>>>>>>>>>>>", e)
        

def teamSponsorDelete():
    try:
        print("Enter the Sponsor, and which team they are sponsoring to:")
        pcin = int(input("Enter CIN of sponsor: "))
        tname = input("which team is {pcin} sponsoring to?")

        query = "DELETE FROM SPONSORS_PLAYER WHERE Name='{tname}' AND CIN={pcin}"
        print(query)
        cur.execute(query)
        con.commit()

        print("deleted succesful")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete")
        print(">>>>>>>>>>>>>", e)

def leagueSponsorInsert():
    try:
        print("Enter the Sponsor, and whom they are sponsoring to:")
        pcin = int(input("Enter CIN of sponsor: "))
        teamname = input("Which Team is {pcin} sponsoring to?")

        query = "INSERT INTO SPONSORS_TEAM VALUES('{teamname}',{pcin})"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted sponsor details of the league into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
        

def leagueSponsorDelete():
    try:
        pcin = int(input("Enter CIN of sponsor: "))
        leagueno = int(input("Which league is {pcin} sponsoring to?"))

        query = "DELETE FROM SPONSORS_LEAGUE WHERE Number = {leaguesno} AND CIN = {pcin}"
        print(query)
        cur.execute(query)
        con.commit()

        print("delete sucessful")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

def playsIn():
    try:
        print("Enter the respective details:")
        tname = input("Enter Team Name:")
        dt = input("Provide date/time of the match'yyyy-mm-dd HH:MM:SS' (without the '') format: ")
        venue = input("Provide venue of the match")
        query = "INSERT INTO PLAYS_IN VALUES('{tname}',{dt},'{venue}')"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted details into the database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def playsForInOf():
    try:
        print("Enter the respective details:")
        pname = input("Enter player Name:")
        tname = input("Whom does {pname} Play for?")
        print("Provide the following details about the match:")
        dt = input("1. Provide date/time of the match'yyyy-mm-dd HH:MM:SS' (without the '') format: ")
        venue = input("2. Provide venue of the match")
        Sno = int(input("In which Season Number does/did this match happen"))
        query = "INSERT INTO PLAYS_FOR_IN_OF VALUES('{pname}','{tname}','{dt}','{venue}',{SNo})"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted details into the database")
    except:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if (ch == 1):
        playerInsert()
    elif (ch == 2):
        formInsert()
    elif (ch == 3):
        teamInsert()
    elif (ch == 4):
        teamMgrInsert()
    elif (ch == 5):
        leagueInsert()
    elif (ch == 6):
        fixtureInsert()
    elif (ch == 7):
        commentatorInsert()
    elif (ch == 8):
        umpireInsert()
    elif (ch == 9):
        partnerInsert()
    elif (ch == 10):
        partnerTypeInsert()
    elif (ch == 11):
        jerseyInsert()
    elif (ch == 12):
        awardInsert()
    elif (ch == 13):
        playerSponsorInsert()
    elif (ch == 14):
        teamSponsorInsert()
    elif (ch == 15):
        leagueSponsorInsert()
    elif (ch == 16):
        playsIn()
    elif (ch == 17):
        playsForInOf()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="password",
                              db='Project4',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1")  # Hire an Employee
                print("2. Option 2")  # Fire an Employee
                print("3. Option 3")  # Promote Employee
                print("4. Option 4")  # Employee Statistics
                print("5. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 5:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")