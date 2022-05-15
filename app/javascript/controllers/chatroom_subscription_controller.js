import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default  class extends Controller {
  static targets = ["messages"]
  static values = { chatroomId: Number }

  connect() {
    console.log(`subscibe to chatroom with the id ${this.chatroomIdValue}`)
    // console.log(banana)
    consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => this.element.insertAdjacentHTML('beforeend', data)}
      )
  }


  // connect() {
  //   console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  // }
}
