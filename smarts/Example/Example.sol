// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// МАССИВЫ, STRUCT, ENUM

contract Example {
    // массивы
    uint[10] items;

    uint[] notItems;

    function sample() public {
        items[0] = 42;
        items[1] = 43;
        items[2] = 44;

        items.length;
        notItems.length;
        notItems.push(2);
        notItems.pop(); // мы вытаскиваем элеменент и длинна массива уменьшается на 1 


        // создание времменого массива с макс количетсвом элементов 7
       // uint[] memory goods = new uint[](7);


        // обход массива

    }

    function count() public pure returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < 10; i++) {
            sum += i;
        }
        return sum;
    }

   // ENUM 
   // часто используется для отслеживание покупки
   enum Statuses {Unpaid, Paid, Shipped}
   Statuses public status;

   function paid() private  {
        status = Statuses.Paid;
   }
   function ship() private {
    if (status == Statuses.Paid) {
        // деаем отправку
    }
    status = Statuses.Shipped;
   }


   // STRUCT 

   struct Payment {
        uint amount;
        uint timestamp;
   }

    Payment[] public payment;

   function sample() private {
        Payment memory peyment = Payment(msg.value, block.timestamp);
        payment.push(peyment);
   }
}