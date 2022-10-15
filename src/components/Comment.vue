<template>
  <div class="container">
    <div class="comment" v-for="pcomment in comments">
      <div class="info">
          <img class="avatar" :src="pcomment.userAvatar" width="36" height="36"/>
        <div class="right">
          <div class="name">{{pcomment.nickName?pcomment.nickName:pcomment.userEmail}}</div>
          <div class="date">{{pcomment.createTime}}</div>
        </div>
      </div>
      <div class="content">{{pcomment.content}}</div>
      <div class="control">
<!--          <span class="like" :class="{active: pcomment.isLike}" @click="likeClick(pcomment)">-->
<!--          <i class="iconfont icon-like"></i>-->
<!--          <span class="like-num">{{pcomment.likeNum > 0 ? pcomment.likeNum + '人赞' : '赞'}}</span>-->
<!--        </span>-->
        <span class="comment-reply" @click="showCommentInput(pcomment)">
              <el-icon :size="25"><ChatDotSquare /></el-icon>
        </span>
      </div>
      <div class="reply">
        <div class="pcomment" v-for="reply in pcomment.childCommentList">
          <div class="info">
            <el-avatar :size="35" :src="reply.replyAvatar"/>
            <div class="right">
              <div class="name">{{reply.replyNickName?reply.replyNickName:reply.replyEmail}}</div>
              <div class="date">{{reply.createTime}}</div>
            </div>
          </div>
          <div class="reply-content1">
            <span v-if="reply.replyReplyId != null && reply.replyReplyId != ''">回复：
              <spav style="color: #409EFF">@{{reply.replyReplyNickName ? reply.replyReplyNickName : reply.replyReplyEmail }}</spav>
            </span>
            <span>{{reply.content}}</span>
          </div>
          <div class="reply-bottom">
            <span class="reply-text" @click="showCommentInput(pcomment, reply)">
              <el-icon :size="25"><ChatDotSquare /></el-icon>
            </span>
          </div>
        </div>
        <transition name="fade">
          <div class="input-wrapper" v-if="showpcommentId === pcomment.id">
            <el-input class="gray-bg-input"
                      v-model="childForm.content"
                      type="textarea"
                      :rows="3"
                      autofocus
                      placeholder="写下你的评论">
            </el-input>
            <div class="btn-control">
              <el-button class="cancel" type="default" round @click="cancel">取消</el-button>
              <el-button class="btn" type="primary" round @click="commitComment(pcomment.id,pcomment.articleId)">确定</el-button>
            </div>
          </div>
        </transition>
      </div>
    </div>
  </div>
</template>

<script>

import Vue from 'vue'
import {ChatDotSquare} from "@element-plus/icons-vue";

export default {
  props: {
    comments: {
      type: Array,
      required: true
    },
  },
  components: {
    ChatDotSquare
  },
  data() {
    return {
      childForm:{
        articleId:'',
        parentId:'',
        replyId:'',
        replyEmail:'',
        replyNickName:'',
        replyAvatar:'',
        replyReplyId:'',
        replyReplyEmail:'',
        replyReplyNickName:'',
        replyReplyAvatar:'',
        content:this.inputComment
      },
      showpcommentId: ''
    }
  },
  computed: {},
  methods: {
    /**
     * 点赞
     */
    likeClick(pcomment) {
      if (pcomment.isLike === null) {
        Vue.$set(pcomment, "isLike", true);
        pcomment.likeNum++
      } else {
        if (pcomment.isLike) {
          pcomment.likeNum--
        } else {
          pcomment.likeNum++
        }
        pcomment.isLike = !pcomment.isLike;
      }
    },

    /**
     * 点击取消按钮
     */
    cancel() {
      this.showpcommentId = ''
    },

    /**
     * 提交评论
     */
    commitComment(pid,articleId) {
      this.childForm.parentId = pid
      this.childForm.articleId = articleId
      console.log(this.childForm)
      this.axios.post("/article/addChildComment",this.childForm,{
        headers:{
          "Authorization": sessionStorage.getItem("token")
        }
      }).then(response => {
        console.log(response)
        this.$message.success("评论成功")
        this.showpcommentId = ''
        this.axios.get("/article/selectComment",{
          params:{
            id:articleId
          }
        }).then(response => {
          this.$emit('changeComments',response.data.data)
        })
      })
    },

    /**
     * 点击评论按钮显示输入框
     * pcomment: 当前大评论
     * reply: 当前回复的评论
     */
    showCommentInput(pcomment, reply) {
      var userinfo = this.$userStore.userinfo
      if (userinfo == null){
        this.$message.warning("请先登录")
        return false
      }
      console.log(reply)
      if (reply) {
        // if (reply.replyNickName == null){
        //   this.childForm.content = "@" + reply.replyEmail + " "
        // }else {
        //   this.childForm.content = "@" + reply.replyNickName + " "
        // }

        this.childForm.replyReplyId = reply.replyId
        this.childForm.replyReplyEmail = reply.replyEmail
        this.childForm.replyReplyAvatar = reply.replyAvatar
        this.childForm.replyReplyNickeName = reply.replyNickName
        this.childForm.replyId = userinfo.id
        this.childForm.replyEmail = userinfo.email
        this.childForm.replyAvatar = userinfo.avatar
        this.childForm.replyNickName = userinfo.nickName
      } else {
        this.childForm.replyId = userinfo.id
        this.childForm.replyEmail = userinfo.email
        this.childForm.replyAvatar = userinfo.avatar
        this.childForm.replyNickName = userinfo.nickName
        this.childForm.content = ''
      }
      this.showpcommentId = pcomment.id
    }
  },
  created() {
    console.log(this.comments)
  }
}
</script>

<style scoped lang="scss">

@import "public/scss/index";

.container {
  padding: 0 10px;
  box-sizing: border-box;
  .comment {
    display: flex;
    flex-direction: column;
    padding: 10px;
    border-bottom: 1px solid $border-fourth;
    .info {
      display: flex;
      align-pcomments: center;
      .avatar {
        border-radius: 50%;
      }
      .right {
        display: flex;
        flex-direction: column;
        text-align: left;
        margin-left: 10px;
        .name {
          font-size: 16px;
          color: $text-main;
          margin-bottom: 5px;
          font-weight: 500;
          text-align: left;
        }
        .date {
          font-size: 12px;
          color: $text-minor;
          text-align: left;
        }
      }
    }
    .content {
      font-size: 16px;
      color: $text-main;
      line-height: 20px;
      padding: 10px 0;
      text-align: left;
    }
    .control {
      display: flex;
      align-pcomments: center;
      font-size: 14px;
      color: $text-minor;
      .like {
        display: flex;
        align-pcomments: center;
        margin-right: 20px;
        cursor: pointer;
        &.active, &:hover {
          color: $color-main;
        }
        .iconfont {
          font-size: 14px;
          margin-right: 5px;
        }
      }
      .comment-reply {
        display: flex;
        align-pcomments: center;
        cursor: pointer;
        &:hover {
          color: $text-333;
        }
        .iconfont {
          font-size: 16px;
          margin-right: 5px;
        }
      }

    }
    .reply {
      margin: 10px 0;
      border-left: 2px solid $border-first;
      .pcomment {
        margin: 0 10px;
        padding: 10px 0;
        border-bottom: 1px dashed $border-third;
        .reply-content {
          display: flex;
          align-pcomments: center;
          font-size: 14px;
          color: $text-main;
          .from-name {
            color: $color-main;
            text-align: left;
          }
          .to-name {
            color: $color-main;
            margin-left: 5px;
            margin-right: 5px;
          }
        }
        .reply-content1{
          display: flex;
          align-pcomments: center;
          margin-top: 6px;
          margin-left: 8px;
          font-size: 15px;
          color: $text-main;
          .reply-text {
            display: flex;
            align-pcomments: center;
            margin-left: 10px;
            cursor: pointer;
            &:hover {
              color: $text-333;
            }
            .icon-comment {
              margin-right: 5px;
            }
          }
        }
        .reply-bottom {
          display: flex;
          align-pcomments: center;
          margin-top: 6px;
          font-size: 12px;
          color: $text-minor;
          .reply-text {
            display: flex;
            align-pcomments: center;
            margin-left: 10px;
            cursor: pointer;
            &:hover {
              color: $text-333;
            }
            .icon-comment {
              margin-right: 5px;
            }
          }
        }
      }
      .write-reply {
        display: flex;
        align-pcomments: center;
        font-size: 14px;
        color: $text-minor;
        padding: 10px;
        cursor: pointer;
        &:hover {
          color: $text-main;
        }
        .el-icon-edit {
          margin-right: 5px;
        }
      }
      .fade-enter-active, fade-leave-active {
        transition: opacity 0.5s;
      }
      .fade-enter, .fade-leave-to {
        opacity: 0;
      }
      .input-wrapper {
        padding: 10px;
        .gray-bg-input, .el-input__inner {
          /*background-color: #67C23A;*/
        }
        .btn-control {
          display: flex;
          justify-content: flex-end;
          align-pcomments: center;
          padding-top: 10px;
          .cancel {
            font-size: 16px;
            color: $text-normal;
            margin-right: 5px;
            cursor: pointer;
            &:hover {
              color: $text-333;
            }
          }
          .confirm {
            font-size: 16px;
          }
        }
      }
    }
  }
}
</style>
