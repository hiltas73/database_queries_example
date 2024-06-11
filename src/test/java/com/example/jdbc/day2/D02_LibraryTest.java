package com.example.jdbc.day2;

import com.example.jdbc.utility.DB_Util;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class D02_LibraryTest {

    // Create connection to MySQL Database
    String url = "jdbc:mysql://00.00.00.000:0000/library2";
    String username =  "secret_username";
    String password =  "super_secret_password";

    @Test
    public void task1(){
        //create connection
        DB_Util.createConnection(url,username,password);

        //run query
        DB_Util.runQuery("select count(*) from books");

        String expectedBooksCount = DB_Util.getFirstRowFirstColumn();

        /*
            Actual comes from UI with selenium,cucumber etc.
         */
        String actualBooksCount = "5392";

        Assertions.assertEquals(expectedBooksCount,actualBooksCount);

        System.out.println(expectedBooksCount);


        //close connection
        DB_Util.destroy();
    }
}
