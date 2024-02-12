<?php

class Status extends MY_Controller {

    function __construct() {
        parent::__construct();

        $this->load->model("master/m_status");
    }

    function search() {
        $r = $this->m_status->search([
            "search" => isset($this->sys_input['search'])?'%'.$this->sys_input['search'].'%':'%',
            "page" => isset($this->sys_input['page'])?$this->sys_input['page']:1,
            "limit" => isset($this->sys_input["limit"])?$this->sys_input["limit"]:10
        ]);

        $this->sys_ok($r);
    }
}
?>