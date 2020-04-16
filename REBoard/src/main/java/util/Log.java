package util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Log {
	private static final Logger log = LoggerFactory.getLogger("spring_prac");
	private final static String em = ">>>";
	
	public static void info(String msg) {
		log.info(em + msg);
	}
}
