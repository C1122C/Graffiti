<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/7
 * Time: 17:37
 */

namespace mian\controller;


class user
{
    var $id;
    var $name;
    var $special;
    var $interest;
    var $location;
    var $contact;
    var $description;
    var $follow;
    var $collection;
    var $mission;
    var $upload;
    var $album;
    var $announce;
    var $publishTag;
    var $searchTag;
    var $mark;
    var $head;

    function __construct(){

    }
    /**
     * @return mixed
     */
    public function getPublishTag()
    {
        return $this->publishTag;
    }

    /**
     * @param mixed $publishTag
     */
    public function setPublishTag($publishTag)
    {
        $this->publishTag = $publishTag;
    }

    /**
     * @return mixed
     */
    public function getSearchTag()
    {
        return $this->searchTag;
    }

    /**
     * @param mixed $searchTag
     */
    public function setSearchTag($searchTag)
    {
        $this->searchTag = $searchTag;
    }

    function get_id(){
        return $this->id;
    }

    function set_id($id){
        $this->id=$id;
    }

    function get_name(){
        return $this->name;
    }

    function set_name($name){
        $this->name=$name;
    }

    function get_special(){
        return $this->special;
    }

    function set_special($special){
        $this->special=$special;
    }

    function get_interest(){
        return $this->interest;
    }

    function set_interest($interest){
        $this->interest=$interest;
    }

    function get_location(){
        return $this->lovation;
    }

    function set_location($location){
        $this->location=$location;
    }

    function get_contact(){
        return $this->contact;
    }

    function set_contact($contact){
        $this->contact=$contact;
    }

    function get_description(){
        return $this->description;
    }

    function set_description($description){
        $this->description=$description;
    }

    function get_follow(){
        return $this->follow;
    }

    function set_follow($follow){
        $this->follow=$follow;
    }

    function get_colloction(){
        return $this->collection;
    }

    function set_collection($collection){
        $this->collection=$collection;
    }


    function get_mission(){
        return $this->mission;
    }

    function set_mission($mission){
        $this->mission=$mission;
    }

    function get_upload(){
        return $this->upload;
    }

    function set_upload($upload){
        $this->upload=$upload;
    }

    function get_album(){
        return $this->album;
    }

    function set_album($album){
        $this->album=$album;
    }

    function get_announce(){
        return $this->announce;
    }

    function set_announce($announce){
        $this->announce=$announce;
    }


    /**
     * @return mixed
     */
    public function getMark()
    {
        return $this->mark;
    }

    /**
     * @param mixed $mark
     */
    public function setMark($mark)
    {
        $this->mark = $mark;
    }
}