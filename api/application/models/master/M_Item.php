<?php

class M_Item extends MY_Model
{
    function __construct()
    {
        parent::__construct();

        $this->table_name = "M_Item";
        $this->table_key = "M_ItemID";
    }

    function search( $d )
    {
        $limit = isset($d['limit']) ? $d['limit'] : 10;
        $offset = ($d['page'] - 1) * $limit;
        $l = ['records'=>[], 'total'=>0, 'total_page'=>1];

        $r = $this->db->query(
                "SELECT M_ItemID position_id, M_ItemCode item_code, M_ItemName item_name, M_ItemCategory item_category, M_ItemUnit item_unit
                FROM `{$this->table_name}`
                WHERE `M_ItemName` LIKE ?
                AND `M_ItemIsActive` = 'Y'
                ORDER BY M_ItemCode asc
                LIMIT {$limit} OFFSET {$offset}", [$d['search']]);
        if ($r)
        {
            $l['records'] = $r->result_array();
        }

        $r = $this->db->query(
            "SELECT count(`{$this->table_key}`) n
            FROM `{$this->table_name}`
            WHERE `M_ItemName` LIKE ?
            AND `M_PositionIsActive` = 'Y'", [$d['search']]);
        if ($r)
        {
            $l['total'] = $r->row()->n;
            $l['total_page'] = ceil($r->row()->n / $limit);
        }
            
        return $l;
    }

    function save ( $d, $id = 0)
    {
        $this->db->set('M_ItemName', $d['item_name'])
                    ->set('M_ItemCategory', $d['item_category'])
                    ->set('M_ItemUnit', $d['item_unit']);
    
        if ($id != 0) {
            $r = $this->db->where('M_ItemID', $id)
                    ->update( $this->table_name );
        }
    
        else {
            $r = $this->db->insert( $this->table_name );
            $id = $this->db->insert_id();
        }

        if ($r)
            return (object) ["status"=>"OK", "data"=>$id, "query"=>$this->db->last_query()];
        return (object) ["status"=>"ERR"];
    }
    function del ($id)
    {
        $this->db->set('M_PositionIsActive', 'N')
            ->where('M_PositionID', $this->sys_input['id'])
            ->update($this->table_name);
        return true;
    }
}

?>