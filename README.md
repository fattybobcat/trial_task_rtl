# trial_task_rtl
trial task rtl. Cross_bar for 4 master &amp; 4 slave

Cross-bar provides switching of 4 masters and 4 slaves
cross_bar.sv

Репозиторий содержит:
1)  interface.sv
    Шину интерфейса для связи master и slave  устройства с cross_bar
    m_s_ifc
    c 2 modport
    -  master_port  ( интерфейс для соединения выхода master и выход cross_bar )
    -  slave_port   ( интерфейс для соединения входа slave и входа cross_bar )
    
2)  Cross_bar.sv
    Модуль, выполняющий коммутацию между 4 master  и 4 slave устройствами
    
3)  round_robin_4.sv
    Модуль, выполняющий функцию round_robin арбитра для slave

4)  master.sv
    Модуль для верификации. Модуль создает "случайные" данные:
    - req           ( запрос на транзакцию );
    - addr[31:30]   ( адресс slave );
    - addr[29:0]    ( случайный адресс для slave );
    - cmd           ( 0 - запись, 1 - чтение );
    - wdata[31:0]   ( данные для записи );
    - параметр LOAD ( для задачи случайно генерации чисел ).
    Master отправляет данные, и ждет ответа от slave. Как приходит ack, и resp - генерирует новые данные

5)  slave.sv
    Модуль для верификации. Модуль принимает данные от master и посылает сигналы ответа.

6)  top_tb.sv 
    Верхний модуль для верификации. (Верификация в данном случае проходила в Questa Sim )
    Создано:
    - 4 master;
    - 4 slave;
    - cross_bar.
7)  top_q.sv
    модуль для Quartus. Единственно - из-за нехватки pin - сократил все входные разрядности 
    
8)  отчеты:
    Quartus 15.1 для Cyclon V 5CGXFC9E6F31|7 
    Fmax - 351 MHz
    
 
