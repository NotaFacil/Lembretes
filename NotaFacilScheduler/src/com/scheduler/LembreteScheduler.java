package com.scheduler;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;


public class LembreteScheduler {

	private ScheduledExecutorService scheduleTaskExecutor ;

	public LembreteScheduler() throws Exception {
			this.scheduleTaskExecutor = Executors.newScheduledThreadPool(100);
	}

	public boolean addSchedule(Runnable runnable, long timeMili){
		try{
			scheduleTaskExecutor.schedule(runnable, timeMili, TimeUnit.MILLISECONDS);
			return true;
		}catch(Exception e){
			System.out.println("Erro ao inserir schedule: " + e.getMessage());
			return false;
		}
	}
}