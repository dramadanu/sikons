<?php

class M_Expense extends MY_Model {

    function __construct() {
        parent::__construct();

        $this->table_name = "m_expense";
        $this->table_key = "M_ExpenseID";
    }

    function search( $prm ) {
        
        $limit = isset($prm['limit'])?$prm['limit']:10;

        $page = isset($prm['page'])?$prm['page']:1;
        $offset = ($page - 1) * $limit;

        $rst = ["records"=>[], "total"=>0, "total_page"=>1];
        $r = $this->db->query("SELECT M_ExpenseCode as expense_code, 
                            M_ExpenseName as expense_name, 
                            M_ExpenseCategory as expense_category, 
                            M_ExpenseUnit as expense_unit
                        FROM {$this->table_name}
                        WHERE (M_ExpenseCode LIKE ? OR M_ExpenseName LIKE ? OR M_ExpenseCategoryID LIKE ? OR M_ExpenseId LIKE ?)
                        AND M_StatusISActive = 'Y'
                        LIMIT ? OFFSET ?", [$prm['search'], $prm['search'], $prm['search'], $prm['search'], $limit, $offset]);


        if ($r->num_rows() > 0) {
            $rst["records"] = $r->result_array();
        }

        $r = $this->db->query("SELECT COUNT({$this->table_key}) as n
                        FROM {$this->table_name}
                        WHERE (M_ExpenseCode LIKE ? OR M_ExpenseName LIKE ? OR M_ExpenseCategoryID LIKE ? OR M_ExpenseId LIKE ?)
                        AND M_StatusISActive = 'Y'", [$prm['search'], $prm['search'], $prm['search'], $prm['search']]);

        if ($r->num_rows() > 0) {
            $r = $r->row();
            $rst["total"] = $r->n;
            $rst["total_page"] = ceil($r->n/$limit);
        }
        

        return $rst;
    }
}
?>