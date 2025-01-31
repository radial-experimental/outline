// @flow
import Logger from "../logging/logger";
import { User } from "../models";

export default class CollaborationLogger {
  async onCreateDocument(data: {
    documentName: string,
    context: { user: User },
  }) {
    Logger.info("hocuspocus", `Created document "${data.documentName}"`, {
      userId: data.context.user.id,
    });
  }

  async onConnect(data: { documentName: string, context: { user: User } }) {
    Logger.info("hocuspocus", `New connection to "${data.documentName}"`);
  }

  async onDisconnect(data: { documentName: string, context: { user: User } }) {
    Logger.info("hocuspocus", `Connection to "${data.documentName}" closed `);
  }
}
