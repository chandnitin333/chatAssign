<?php

namespace App\Http\Controllers;

use App\Models\JobsModel;
use App\Models\JobuserModel;
use App\Models\UserChatModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class MainController extends Controller
{
    function index()
    {
     return view('login');
    }
    function checkLogin(Request $request)
    {
        $request->validate([
            'email'             =>  'required|email',
            'password'          =>  'required',
        ],[
            'email.required'        =>  'Email must be required',
            'password.required'     =>  'Password must be required',
        ]);

       $success = JobuserModel:: select('*')->where('email',$request->get('email'))->where('password',$request->get('password'))->get()->toArray();
        if(!empty($success)){
            Session::put('auth',$success[0]);
            $notification = array(
                'message'       =>  'Login successfully',
                'alert-type'    =>  'success'
            );
            return redirect()->route('dashboard')->with($notification);
        }else{
            $notification = array(
                'message'       =>  'Wrong login details',
                'alert-type'    =>  'error'
            );
            return redirect()->back()->with($notification);
        }
        
    
    }
    function dashboard(){
        $jobs = JobsModel::with('username')->get();
        $jobs = (count($jobs) > 0) ? $jobs->toArray() : $jobs;
        return view('dashboard',compact('jobs'));
    }
    function logout()
    {
        Auth::logout();
        Session::flush();
        return redirect('/');
    }
    function inbox($id){
        $oneJobs = JobsModel::findOrFail($id)->toArray();
        $jobs = JobsModel::with('username')->where('description','!=',$oneJobs['description'])->get();
        return view('inbox',compact('jobs','oneJobs'));
    }
    function contact($id){
        
        $oneJobs = JobsModel::findOrFail($id)->toArray();
        $jobs = JobsModel::with('username')->where('description','!=',$oneJobs['description'])->get();
        return view('contact',compact('jobs','oneJobs'));
    }
    function comment(Request $request){
        $param = $request->all();
        unset($param['_token']);
        $notification = array();
        if(UserChatModel::insert($param)){
            $query =  UserChatModel :: query();
             $query->with(['userDetails'])
            ->select('*')
            ->where('user_from_id',$param['user_from_id'])
            ->Orwhere('user_to_id',$param['user_from_id']);

            $allchat =  $query->get();
            $allchat = (count($allchat) > 0) ? $allchat->toArray() : $allchat;
            
            $notification = array(
                'message'       =>  'Sent',
                'alert-type'    =>  'success',
                'data'          =>  $allchat
            );

        }else{
            $notification = array(
                'message'       =>  'Failed to sent',
                'alert-type'    =>  'error'
            );
        }

        return $notification;
    
    }
    function get_comment(Request $request){
        
    $param = $request->all();
    $notification = array();
    $query =  UserChatModel :: query();
    
    $query->with(['userDetails'])
    ->select('*')
    ->where('user_from_id',$param['user_from_id'])
    ->Orwhere('user_to_id',$param['user_from_id']);

    $allchat =  $query->get();
    $allchat = (count($allchat) > 0) ? $allchat->toArray() : $allchat;
    
    return $notification = array(
        'message'       =>  'success',
        'alert-type'    =>  'success',
        'data'          =>  $allchat
    );
            
    }
    
}
