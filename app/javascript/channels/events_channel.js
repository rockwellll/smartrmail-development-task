import consumer from "./consumer"


export const createConsumerFor = (vueStore) => {
    return consumer.subscriptions.create("EventsChannel", {
        received(data) {
            vueStore.commit("addEvent", data.event);
        }
    });
}
