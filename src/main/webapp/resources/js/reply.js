//선언문
async function doA() { //비동기방식 사용 async붙여야함.

    console.log("doA.........................")

    const response = await axios.get("/replies")//비동기통신에서 끝날때까지 기다렸다가 데이터 가지고옴 > response에 담음.
    const data = response.data
    //비동기나 then걸리면 무조건 await사용
    console.log("doA..data", data)
    return data //
}

//선언식
const doB = (fn) => {//화살표 함수 방식
    console.log("doB.............................")
    //axios객체는 아래와 같이 간단하게 HTTP요청을 할 수 있습니다.
    try {
        axios.get('/replies').then(response => {// axios에서 /replies의 요청을  get한 다음에(then) 처리
            console.log(response)
            const arr = response.data
            fn(arr)//함수받고 비동기통신 끝나면 실행해줘
        })
    } catch (error) {
       console.log(error)
    }

}

async function doC (obj){ // read에서 받는 파라미터

    const response = await axios.post("/replies", obj)//비동기 처리
    // console.log('doC', response)
    return response.data

}

const doD = async (rno) => {
    const response = await axios.post(`/replies/${rno}`)
    return response.data
}

const doE = async (reply) => {

    const response = await axios.put(`/replies/${reply.rno}`, reply)
    return response.data
}

