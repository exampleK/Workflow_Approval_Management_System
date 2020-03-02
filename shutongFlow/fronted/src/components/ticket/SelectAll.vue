<template> 
  <div class="container">
    <div class="header-login-regist" style="width: 100%">
      <Input style="width: 10%;" placeholder="姓名" v-model="selectname"></Input>
      <DatePicker placeholder="开始时间" v-model="selectstart" type="datetime" format="yyyy-MM-dd HH:mm:ss" ></DatePicker>
      <DatePicker placeholder="结束时间" v-model="selectend" type="datetime" format="yyyy-MM-dd HH:mm:ss"  ></DatePicker>
      <el-button  style="width: 5%;" v-on:click="selectChange" type="button">查询</el-button>
    </div>
    <Card>
    <Table :columns="datatable.columns" :data="datatable.data" size="small"></Table>
    <br>
    <Page :total="total" show-sizer show-total @on-change="selectChangePage" size="small"></Page>
    </Card>
  </div>
</template>

<script>
import Buttons from '../../utils/buttons'
import {Date} from '../../utils/datetime'
export default {
  name: 'all',
  data () {
    return {
      datatable: {
        columns: [
          {
            key: 'sn',
            title: '流水号',
            minWidth: 220,
            align: 'center'
          },
          {
            key: 'title',
            title: '标题',
            align: 'center',
            minWidth: 150,
          },
          {
            key: 'workflow',
            title: '业务流程',
            align: 'center',
            width: 150,
            render: (h, params) => {
              return h('div', [
                h('span', {}, params.row.workflow.workflow_name)
              ])
            }
          },
          {
            key: 'state',
            title: '当前状态',
            align: 'center',
            width: 150,
            render: (h, params) => {
              return h('div', [
                h('span', {}, params.row.state.state_name)
              ])
            }
          },
          {
            key: 'creator',
            title: '创建人',
            align: 'center',
            width: 100,
          },
          {
            key: 'gmt_created',
            title: '创建时间',
            align: 'center',
            width: 150,
          },
          {
            key: 'gmt_modified',
            title: '更新时间',
            align: 'center',
            width: 150,
          },
          {
            key: 'action',
            title: '操作',
            align: 'center',
            fixed: 'right',
            minWidth: 100,
            render: (h, params) => {
              return h('div', [
                Buttons.detailButton(this, h, params)
              ])
            }
          }
        ],
        data: []
      },
      total: 0,
    }
  },
  methods: {
    init () {
      this.$store.dispatch('api_get_ticket_list', {category: 'all'}).then(resp => {
        this.datatable.data = resp.data.data.value
        this.total = resp.data.data.total
      }).catch(error => {
        console.log(error)
      })
    },
    handleChangePage (page) {
      this.$store.dispatch('api_get_ticket_list', {category: 'all', page: page}).then(resp => {
        this.datatable.data = resp.data.data.value
        this.total = resp.data.data.total
      }).catch(error => {
        console.log(error)
      })
    },
    
    selectChange (page) {
      this.$store.dispatch('api_get_ticket_select', {category: 'all',time_start:this.selectstart.format("yyyy-MM-dd"),time_end:this.selectend.format("yyyy-MM-dd"),select_name:this.selectname,page: '1'}).then(resp => {
        this.datatable.data = resp.data.data.value
        this.total = resp.data.data.total
      }).catch(error => {
        console.log(error)
      })
    },
    selectChangePage (page) {
      this.$store.dispatch('api_get_ticket_select', {category: 'all',time_start:this.selectstart.format("yyyy-MM-dd"),time_end:this.selectend.format("yyyy-MM-dd"),select_name:this.selectname,page: page}).then(resp => {
        this.datatable.data = resp.data.data.value
        this.total = resp.data.data.total
      }).catch(error => {
        console.log(error)
      })
    }
  },
  mounted () {
    this.init()
  }
}
</script>
