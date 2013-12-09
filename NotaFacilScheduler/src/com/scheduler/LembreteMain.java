package com.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.bean.Lembrete;
import com.db.dao.impl.LembreteDaoImpl;
import com.email.Email;

public class LembreteMain {

	public static void main(String[] args) throws Exception {

		LembreteScheduler lembreteSchedule = new LembreteScheduler();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		long sleepTime = 180000;
		
		while(true){
			System.out.println("\nIniciando processo de varredura e inserção de schedules... " + sdf.format(new Date()));
			final LembreteDaoImpl lembreteDao = new LembreteDaoImpl();
			for (final Lembrete lembrete : lembreteDao.listar()) {
				
				if(lembrete.getDhLembrar() != null && lembrete.getEnviado() == 0){
					System.out.println("Inserindo schedule Lembrete id: " + lembrete.getId() + " " + sdf.format(lembrete.getDhLembrar()));
					lembreteSchedule.addSchedule(
						new Runnable() {
							@Override
							public void run() {
								try {
									if(Email.enviarLembrete(lembrete)){
										lembrete.setEnviado(2);
										lembreteDao.atualizar(lembrete);
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						}
						, lembrete.getDhLembrar().getTime() - new Date().getTime());
					lembrete.setEnviado(1);
					lembreteDao.atualizar(lembrete);
				}
			}
			System.out.println("Próxima varredura será em " + (sleepTime / 1000) / 60 + "...\n");
			Thread.sleep(sleepTime);
		}
	}
}
