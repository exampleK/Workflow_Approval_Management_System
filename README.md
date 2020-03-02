#参考loonflow和shutong object


#改进：

1.修改图片上传失败(上传路径\shutongFlow\apps\media\upload)  
2.增加修改密码(后期加原密码验证增加安全性)  
3.增加对审批人的业绩积分统计表  
4.增加查询条件姓名和时间  


(https://github.com/exampleK/Workflow_Approval_Management_System/blob/master/img/yeji1.PNG)  
(https://github.com/exampleK/Workflow_Approval_Management_System/blob/master/img/yeji2.PNG)  
(https://github.com/exampleK/Workflow_Approval_Management_System/blob/master/img/yeji3.PNG)  


#(1)
6061 shutong前端的菜单修改     
路径:shutongFlow\fronted\src\router\routers.js中(下面各个vue文件对于菜单中的各个页面)
备注:添加相应前端的js函数需要到路径shutongFlow\fronted\src\store\index.js

修改完前端的vue和对应的js后
#(2)
需要修改6062的后端响应数据部分（大概数据传参和相应为：6060loonflow后端->6062shutong后端->6061shutong前端）
路径：shutongFlow\apps\service\views.py 6062后端的路由判断页面

通过（2）中构造好的url传递为6060loonflow前端（我的修改shutong修改密码api在此处）

#(3)
接收6062传递过来的参数
路径：loonflow-r0.3.23\apps\ticket\views.py
备注：然后具体实现方法get_ticket_select

apps\ticket\views.py

ticket_result_restful_list, msg = 
TicketBaseService.“get_ticket_select”
(creator=select_name,sn=sn, title=title, username=username, create_start=create_start, create_end=create_end, workflow_ids=workflow_ids, state_ids=state_ids, ticket_ids=ticket_ids,
category=category, reverse=reverse, per_page=per_page, page=page, app_name=app_name, is_end=is_end, is_rejected=is_rejected)



#安装参考shutogn：
shutongFlow
## 这里使用conda作为虚拟环境，如果你使用virtualenv只是激活命令不一样；
Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ source activate loonflow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ pip install -r apps/requirements.txt

# 初始化数据库
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ mysql -uroot
> create database shutongflow default charset utf8;
> create database loonflownew default charset utf8;
> grant all privileges on shutongflow.* to shutongflow@127.0.0.1 identified by '123456';
> grant all privileges on loonflownew.* to loonflownew@127.0.0.1 identified by '123456';

(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ python manage.py makemigrations
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$ python manage.py migrate

(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py makemigrations
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py migrate

## 导入第三方数据（这里主要是用户数据）
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow$ mysql -uroot shutongflow < shutongflow.sql
## 导入loonflow数据（配置数据及用户数据）
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow$ mysql -uroot loonflownew < loonflownew.sql

## 启动shutongFlow和loonflow
(loonflow) Webb@MacBookPro ~/Developer/Python/loonflow/loonflow$  python manage.py runserver 0.0.0.0:6060 # 启动loonflow
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/apps$ python manage.py runserver 0.0.0.0:6062 # 启动shutongflow

## 启动vue
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm install .
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm run dev

# 如果提示npm包有安全提示可以使用以下命令进行修复
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm audit fix
(shutongflow) Webb@MacBookPro ~/Developer/Python/loonflow/shutongFlow/fronted$ npm audit fix --force
登陆
shutongFlow中所有普通用户

'webb': asdasd，
'ops': asdasd，
'hr': asdasd，
'scm': asdasd，
'webb': asdasd，
'lilian': asdasd，
'david': asdasd
管理员为
'admin': yxuqtr

#其他
其中页面 请求函数载下面 比如 
fronted\src\components\ticket\Index.vue vue文件

请求函数 this.$store.dispatch('api_get_ticket_select', {category: 'all',time_start:this.selectstart.format("yyyy-MM-dd"),time_end:this.selectend.format("yyyy-MM-dd"),select_name:this.selectname,page: page}).then(resp => {

api_get_ticket_select' 在  fronted\src\store\index.js 中


api_get_ticket_select: (context, params) => {
      let url = `/api/v1/service/tickets/?category=${params.category}&select_name=${params.select_name}&time_start=${params.time_start}&time_end=${params.time_end}&page=${params.page}`
      return new Promise((resolve, reject) => {
        axios.get(url).then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    },

其中 url请求 去 apps\service\views.py这个页面

----------------------------------------------------------
然后具体实现方法get_ticket_select
apps\ticket\views.py

ticket_result_restful_list, msg = TicketBaseService.get_ticket_select(creator=select_name,sn=sn, title=title, username=username, create_start=create_start, create_end=create_end, workflow_ids=workflow_ids, state_ids=state_ids, ticket_ids=ticket_ids,
                                                                                category=category, reverse=reverse, per_page=per_page, page=page, app_name=app_name, is_end=is_end, is_rejected=is_rejected)
get_ticket_select





shutongFlow\apps\service\views.py 6062后端的路由判断页面

shutongFlow\fronted\src\store\index.js 6061 前端的vue函数引用页面

shutongFlow\fronted\src\router\routers.js 6061 前端路由页面

loonflow-r0.3.23\apps\ticket\views.py 6060后端路由页面，根据6062后端传过来url后跟参数判断