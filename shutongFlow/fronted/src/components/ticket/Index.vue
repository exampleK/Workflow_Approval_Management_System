<template> 
  <div class="container">
    <Card>
    <Table :columns="datatable.columns" :data="datatable.data" size="small"></Table>
    <br>
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
            key: 'creator',
            title: '创建人',
          },
          {
            key: 'fv',
            title: '目前累计',
          },
        ],
        data: []
      },
      total: 0,
    }
  },
  methods: {
    init () {
      this.$store.dispatch('api_get_ticket_index_list', {category: 'all',index: 'all'}).then(resp => {
        this.datatable.data = resp.data.data.value
        this.total = resp.data.data.total
      }).catch(error => {
        console.log(error)
      })
    },
  },
  mounted () {
    this.init()
  }
}
</script>
