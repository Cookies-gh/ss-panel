<?php

namespace App\Models;

/**
 * Node Model
 */

use App\Utils\Tools;
use App\Services\Analytics, App\Services\DbConfig;

class Node extends Model

{
    protected $table = "ss_node";


    public function getLastNodeInfoLog()
    {
        $id = $this->attributes['id'];
        $log = NodeInfoLog::where('node_id', $id)->orderBy('id', 'desc')->first();
        if ($log == null) {
            return null;
        }
        return $log;
    }

    public function getNodeUptime()
    {
		
		$regex = '/[\d]+ day(s)*,[ ]+([\d]+:[\d]+)*([\d]+)*( min)*/';
		$str=exec("uptime", $system);
		//echo $str;
		$matches = array();
 
		if(preg_match_all($regex, $str, $matches)){
			return ($matches[0][0]);
		}
 
		return "暂无数据";
    }

    public function getNodeLoad()
    {
        $regex = '/\d.[\d]+, \d.[\d]+, \d.[\d]+/';
		$str=exec("uptime", $system);
		//echo $str;
		$matches = array();
 
		if(preg_match_all($regex, $str, $matches)){
			return ($matches[0][0]);
		}
 
		return "暂无数据";
    }

    public function getLastNodeOnlineLog()
    {
        $id = $this->attributes['id'];
        $log = NodeOnlineLog::where('node_id', $id)->orderBy('id', 'desc')->first();
        if ($log == null) {
            return null;
        }
        return $log;
    }

    function getOnlineUserCount()
    {
		//return 111;
		$sts = new Analytics();
		return $sts->getOnlineUser(60);
		//define(ALL_PS,"PHP100");
		//echo("aaa");
		
        $log = $this->getLastNodeOnlineLog();
		
		
        if ($log == null) {
            return "暂无数据";
        }
        //return $log->online_user;
		return $log;
    }

    function getTrafficFromLogs()
    {
		// add by zyc
		$sts = new Analytics();
        return $sts->getTrafficUsage();
		
		$id = $this->attributes['id'];
        $traffic = TrafficLog::where('node_id', $id)->sum('u') + TrafficLog::where('node_id', $id)->sum('d');
        if ($traffic == 0) {
            return "暂无数据";
        }
        return Tools::flowAutoShow($traffic);
    }

}
