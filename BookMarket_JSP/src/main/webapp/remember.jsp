기억하자!

시큐리티를 설정하려면 Servers > tomcat-users.xml 부분에서
role rolename, user username 의 주석을 풀어줘야 한다. 파일 오류가 뜰 수도 있는데 작동하는 데는 문제 없는듯.
admin 을 추가해야 한다면 <!-- <role rolename="admin"/> --> 이 부분과
<!-- <user username="admin" password="admin1234" roles="admin"/> --> 이 부분을 추가해준다. 주석은 추가 후 지우도록.