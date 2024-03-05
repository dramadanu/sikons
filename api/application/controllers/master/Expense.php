<?php

class Expense extends MY_Controller
{
    function __construct()
    {
        parent::__construct();

        $this->load->model('master/m_expense');
    }

    function search()
    {
        $r = $this->m_expense->search([
            'search'=>'%'.$this->sys_input['search'].'%', 
            'limit'=>10, 
            'page'=>$this->sys_input['page']]);
        $this->sys_ok($r);
    }

    function search_dd()
    {
        $r = $this->m_expense->search([
            'search'=>'%'.$this->m_expense['search'].'%', 
            'limit'=>99999, 
            'page'=>1]);
        $this->sys_ok($r);
    }

    function save()
    {
        // $this->sys_input['user_id'] = $this->sys_user['user_id'];
        if (isset($this->sys_input['item_id']))
            $r = $this->m_expense->save( $this->sys_input, $this->sys_input['item_id'] );
        else
            $r = $this->m_expense->save( $this->sys_input );
        
        if ($r->status == "OK")
            $this->sys_ok($r->data);
        else
            $this->sys_error('ERROR');
    }

    function del()
    {
        $r = $this->m_expense->del( $this->sys_input );
        $this->sys_ok($r);
    }
}

?>