package iti.jets.Managers;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class SessionManager {

    private static final Map<String, Integer> sessionStore = new ConcurrentHashMap<>();

    public static void addSession(String sessionId, Integer userId) {
        sessionStore.put(sessionId, userId);
    }

    public static Integer getUserId(String sessionId) {
        return sessionStore.get(sessionId); // Returns null if sessionId doesn't exist
    }

    public static void removeSession(String sessionId) {
        sessionStore.remove(sessionId);
    }

    public static boolean isSessionValid(String sessionId) {
        return sessionStore.containsKey(sessionId);
    }

    public static void clearAllSessions() {
        sessionStore.clear();
    }

    public static Map<String, Integer> getAllSessions() {
        return new ConcurrentHashMap<>(sessionStore);
    }
}
