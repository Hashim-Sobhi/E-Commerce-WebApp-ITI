package iti.jets.listeners;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import iti.jets.Managers.DatabaseManager;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import java.lang.InterruptedException;


public class ContextListener implements ServletContextListener {

    public void contextInitialized (ServletContextEvent cse) {
//        DBFactory.getInstance();
////        MyLocal.getInstance().set(DBFactory.getInstance().createEntityManager());
//        CategoryService categoryService =  CategoryService.getInstance();
//        SizeService sizeService =  SizeService.getInstance();
//
//        List<CategoryDto> categoryDtos = categoryService.getAll();
//        cse.getServletContext().setAttribute("cats", categoryDtos);
//
//        List<SizeDto> sizeDtos = sizeService.listAllSizes();
//        cse.getServletContext().setAttribute("sizes", sizeDtos);


    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseManager.close();
        AbandonedConnectionCleanupThread.checkedShutdown();
    }
    
}