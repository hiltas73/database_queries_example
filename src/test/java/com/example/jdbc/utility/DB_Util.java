package com.example.jdbc.utility;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DB_Util {

    // declaring at class level so all methods can access
    private static Connection con ;
    private static Statement stm ;
    private static ResultSet rs ;
    private static ResultSetMetaData rsmd ;


    /**
     * Create Connection by jdbc url and username , password provided
     * @param url  jdbc url for any database
     * @param username username for database
     * @param password password for database
     */
    public static void createConnection(String url , String username, String password){


        try {
            con = DriverManager.getConnection(url, username, password) ;
            System.out.println("CONNECTION SUCCESSFUL");
        } catch (Exception e) {
            System.out.println("CONNECTION HAS FAILED " + e.getMessage() );
        }

    }

    /**
     * Create connection method , just checking one connection successful or not
     */
    public static void createConnection(){

        String url      = "jdbc:oracle:super_secret"; ;
        String username = "secret" ;
        String password = "secret" ;

        createConnection(url, username, password);

    }


    /**
     * Run the sql query provided and return ResultSet object
     * @param sql the query to run
     * @return ResultSet object  that contains data
     */
    public static ResultSet runQuery(String sql){

        try {
            stm = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stm.executeQuery(sql); // setting the value of ResultSet object
            rsmd = rs.getMetaData() ;  // setting the value of ResultSetMetaData for reuse
        }catch(Exception e){
            System.out.println("ERROR OCCURRED WHILE RUNNING QUERY "+ e.getMessage() );
        }

        return rs ;

    }

    /**
     * destroy method to clean up all the resources after being used
     */
    public static void destroy(){
        // WE HAVE TO CHECK IF WE HAVE THE VALID OBJECT FIRST BEFORE CLOSING THE RESOURCE
        // BECAUSE WE CAN NOT TAKE ACTION ON AN OBJECT THAT DOES NOT EXIST
        try {
            if( rs!=null)  rs.close();
            if( stm!=null)  stm.close();
            if( con!=null)  con.close();
        } catch (Exception e) {
            System.out.println("ERROR OCCURRED WHILE CLOSING RESOURCES " + e.getMessage() );
        }

    }

    /**
     * find out the column count
     * @return column count of this ResultSet
     */
    public static int getColumnCount(){

        int columnCount = 0 ;

        try {
            columnCount = rsmd.getColumnCount();

        } catch (Exception e) {
            System.out.println("ERROR OCCURRED WHILE GETTING COLUMN COUNT " + e.getMessage() );
        }

        return columnCount ;

    }

    /**
     * // Get all the Column names into a list object
     * @return  List<String>
     */
    public static List<String> getAllColumnNamesAsList(){

        List<String> columnNameLst = new ArrayList<>();

        try {
            for (int colIndex = 1; colIndex <= getColumnCount() ; colIndex++) {
                String columnName =  rsmd.getColumnName(colIndex) ;
                columnNameLst.add(columnName) ;
            }
        }catch (Exception e){
            System.out.println("ERROR OCCURRED WHILE getAllColumnNamesAsList "+ e.getMessage());
        }

        return columnNameLst ;

    }

    /**
     * Get First Cell Value at First row First Column
     */
    public static String getFirstRowFirstColumn(){

        return getCellValue(1,1) ;

    }

    /**
     * getting the cell value according to row num and column name
     * @param rowNum  row number to get the data from
     * @param columnName column Name to get the data from
     * @return the value in String at that location
     */
    public static String getCellValue(int rowNum ,String columnName){

        String cellValue = "" ;

        try {
            rs.absolute(rowNum) ;
            cellValue = rs.getString( columnName ) ;

        } catch (Exception e) {
            System.out.println("ERROR OCCURRED WHILE getCellValue " + e.getMessage() );
        }finally {
            resetCursor();
        }
        return cellValue ;

    }

    /**
     * This method will reset the cursor to before first location
     */
    private static void resetCursor(){

        try {
            rs.beforeFirst();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
