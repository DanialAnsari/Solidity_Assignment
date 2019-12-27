pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Assignment{

address payable private myAddress=0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
enum classType{
    ONLINE,
    ONSITE
}

enum gender{
    MALE,
    FEMALE
}

struct Student{
        string name;
        uint age;
        uint rollNo;
        bool degree;
        address payable  studentAddress;
        classType class;
        gender Gender;
    }
    

    
  
    

    uint enrCount=0;
    uint temproll;

mapping(uint=>Student) public studentRoll;
mapping(uint=>uint) public amountPaid;

function AddStudent(string memory name,uint age,bool degree,uint _roll,classType _class,gender _gender,address payable stAddress) public {
    Student memory enrolledStudents;
    enrolledStudents.name=name;
    enrolledStudents.age=age;
    enrolledStudents.studentAddress=stAddress;
    enrolledStudents.rollNo=_roll;
 enrolledStudents.Gender=_gender;
 enrolledStudents.class=_class;
        enrolledStudents.degree=degree;
    
    studentRoll[_roll]=enrolledStudents;
    
}


function countOfEnrolledStudents() public view returns(uint){
    
    return enrCount;
}


function ViewStudentAddress(uint rollNo) public view returns(address){
         Student memory st=studentRoll[rollNo];
       
       
        return st.studentAddress;

    }



    function  pay4Enroll(uint rollNo) payable public returns(string memory){
        string memory msg1="Enrollment Sucessful Welcome";
        string memory msg2="Enrollment unSucessful Not enough ether";
        if (msg.value>=2000000000000000000){
            
             enrCount+=1;
             myAddress.transfer(msg.value);
             amountPaid[rollNo]=msg.value;
             temproll=0;
             return msg1;
        }
        else{
           
            return msg2;
        }
        
    }
    
  
  
}