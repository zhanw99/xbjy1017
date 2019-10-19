package loginUtil;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JDBCUtil {

    private static DataSource dataSource;

    static {
        Properties pro = new Properties();
        InputStream in = JDBCUtil.class.getResourceAsStream("/db.properties");
        try {
            pro.load(in);
            try {
                dataSource = DruidDataSourceFactory.createDataSource(pro);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取单个连接
     *
     * @return
     */
    public static Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取数据源
     *
     * @return
     */
    public static DataSource getDataSource() {
        return dataSource;
    }

    /**
     * 关闭资源
     *
     * @param conn
     * @param stat
     * @param rs
     */
    public static void close(Connection conn, Statement stat, ResultSet rs) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stat != null) {
            try {
                stat.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



//    //初始化参数
//    public static Connection util() {
//        Connection conn = null;
//        Map<String, String> path = getPath();
//        try {
//            conn = DriverManager.getConnection(path.get("Url"), path.get("User"), path.get("Password"));
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return conn;
//    }
//
//    //找到资源文件
//    public static Map<String, String> getPath() {
//        Map map = new HashMap();
//        Properties properties = new Properties();
//        try {
//            properties.load(JDBCUtil.class.getResourceAsStream("/db.properties"));
//            map.put("Driver", properties.getProperty("Driver"));
//            map.put("Url", properties.getProperty("Url"));
//            map.put("User", properties.getProperty("User"));
//            map.put("Password", properties.getProperty("Password"));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//
//        return map;
//    }
}
