<?php

class M_City extends MY_Model
{
    function __construct()
    {
        parent::__construct();

        $this->table_name = "M_City";
        $this->table_as = 'city';

        $tname = $this->table_name;
        $tas = $this->table_as;

        $this->table_key = $tname."ID";
        $this->table_field = array(
            ['field'=>$tname.'ID','as'=>$tas.'_id'],
            ['field'=>$tname.'Code','as'=>$tas.'_code'],
            ['field'=>$tname.'Name','as'=>$tas.'_name'],
            ['field'=>$tname.'M_ProvinceID','as'=>$tas.'_province'],
            ['field'=>$tname.'IsDefault','as'=>$tas.'_default'],
            ['field'=>$tname.'ROID','as'=>$tas.'_roid'],
        );
        $this->table_field_search = $tname."Name";
        $this->table_field_sort = $tname."Name";
        $this->table_field_active = $tname."IsActive";
    }

    function search( $d )
    {
        $limit = "";
        $offset = "";
        if($d['limit']!=0)
        {
            $limit = isset($d['limit']) ? $d['limit'] : 10;
            $offset = ($d['page'] - 1) * $limit;
        }
        $l = ['records'=>[], 'total'=>0, 'total_page'=>1];
        $f = "";
        $af = $this->table_field;
        for($x=0;$x<count($af);$x++)
        {
            $f .= ($x!=0) ? ', ' : '';
            $f .= $af[$x]['field'] . ' as '. $af[$x]['as'];
        }

        $tsearch = (isset($d['search'])&&$d['search']!='')
            ? " `$this->table_field_search` LIKE ? AND"
            : " ";
        $tlimit = '';
        $tlimit = (isset($d['limit'])&&$d['limit']!='0')
            ? " LIMIT {$limit} OFFSET {$offset} "
            : "";

        $q = "
            SELECT $f 
                , M_ProvinceName as ".$this->table_as."_provincename
            FROM `{$this->table_name}`
            LEFT OUTER JOIN m_province ON M_CityM_ProvinceID = M_ProvinceID and M_ProvinceIsActive = 'Y'
            WHERE ".$tsearch." 
            `$this->table_field_active` = 'Y'
            AND M_CityM_ProvinceID = ?
            ORDER BY `$this->table_field_sort` asc
            $tlimit
        ";
        $r = $this->db->query($q, [$d['search'], $d['province_id']]);
        if ($r)
        {
            $l['records'] = $r->result_array();
        }
        $qall = "
            SELECT count(`{$this->table_key}`) n
            FROM `{$this->table_name}`
            WHERE $tsearch
            `$this->table_field_active` = 'Y'
            AND M_CityM_ProvinceID = ?
        ";
        $r = $this->db->query($qall, [$d['search'], $d['province_id']]);
        if ($r)
        {
            if($d['limit']!='0') {
                $l['total'] = $r->row()->n;
                $l['total_page'] = ceil($r->row()->n / $limit);
            }
        }
        return $l;
    }

    function save ( $d, $id = 0)
    {
        $fa = $this->field;
        unset($fa[0]);
        $f = array();
        for($x=1;$x<=count($fa);$x++)
        {
            $f[$fa[$x]['field']] = $fa[$x]['as'];
        }
        $this->db->set($f);
    
        if ($id != 0) {
            $r = $this->db->where($this->table_key, $id)
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
}

?>