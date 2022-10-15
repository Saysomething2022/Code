import { defineStore } from 'pinia'
export const UserStore = defineStore({
// id 是必填的，并且所有 Store 中唯一。因为Pinia会将它在devtools显示
    id: 'UserInfo',
    state: () => {
        return {
            userinfo:JSON.parse(sessionStorage.getItem("userinfo")),
            token:sessionStorage.getItem("token"),
            category:'article',
            typeId:1,
            achievement:JSON.parse(sessionStorage.getItem("achievement")),
            isconnection:false,
            messageNumber:sessionStorage.getItem("messageNumber"),
            hover:0
        }
    },
    getters: {
        getuserinfo(){
            return this.userinfo
        }
    },
    actions: {
        setUserInfo(userinfo){
            this.userinfo = userinfo
            if (userinfo == null){
                sessionStorage.removeItem("userinfo")
            }
            sessionStorage.setItem("userinfo",JSON.stringify(userinfo))
        },
        setCategory(category){
            this.category = category
        },
        setToken(token){
            this.token = token
            if (token == null){
                sessionStorage.removeItem("token")
            }
            sessionStorage.setItem("token",token)
        },
        setAchievement(achievement){
            this.achievement = achievement
            sessionStorage.setItem("achievement",JSON.stringify(achievement))
        },
        setMessageNumber(number){
            this.messageNumber= number
            sessionStorage.setItem("messageNumber",number)
        },
        setTypeId(typeId){
            this.typeId= typeId
        }
    }
})
