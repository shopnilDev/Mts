import React from 'react'


// icons==== 
import { IoClose } from "react-icons/io5";

const Contact = ({handleContactClose}) => {
    return (
        <>
            <section className=' right-0 top-0 bg-white w-3/4 md:w-[40%] h-screen p-5 pt-10 z-10 fixed'>
            <IoClose onClick={handleContactClose} className='absolute right-4 top-2 text-2xl cursor-pointer'/>
                <div>
                    <h1 className='text-4xl font-semibold text-center'>Contact Us</h1>

                    <form action="#" className='mt-10 flex flex-col gap-10'>
                        <div className='md:flex gap-9'>
                        <div className='flex flex-col text-lg'>
                            <label htmlFor="">First Name</label>
                            <input type="text" placeholder='First Name' className='border-b-2 border-black outline-none py-1 w-full ' required />
                        </div>
                        <div className='flex flex-col  text-lg mt-9 md:mt-0'>
                            <label htmlFor="">Last Name</label>
                            <input type="text" placeholder='First Name' className='border-b-2 border-black outline-none py-1 ' required />
                        </div>

                        </div>
                        <div className='flex flex-col text-lg'>
                            <label htmlFor="">Email</label>
                            <input type="email" placeholder='First Name' className='border-b-2 border-black outline-none py-1 ' required />
                        </div>
                        <div className='flex flex-col text-lg'>
                            <label> Write a message</label>
                            <textarea name="" cols={14} rows={2} id="" className='border-b-2 border-black outline-none py-1 '></textarea>
                        </div>
                        <button  type='submit' className='text-start bg-gray-800 w-fit text-white p-2 px-5 text-lg rounded-md uppercase border hover:bg-transparent hover:text-black hover:border-2 hover:border-black'>submit</button>
                    </form>

                </div>
            </section>
        </>
    )
}

export default Contact
