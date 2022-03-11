import { derived, writable } from "svelte/store";
import http from "$lib/http";
import Cookie from "js-cookie";

export default class AuthStore {
  state = {
    access_token: "",
    user: {},
    authenticated: false,
  };

  constructor(state) {
    this.state = state;
  }

  logoutUser() {}

  async loginUser(form) {
    const data = await http(fetch)("auth/login", "POST", form);
    if (!data.error) {
      return this.setAuth(data);
    } else {
      return { error: data.error };
    }
  }

  async registerUser(form) {
    const { data } = await http(fetch)("auth/register", "POST", form);

    if (!data.error) {
      return this.setAuth(data);
    } else {
      return { error: data.error };
    }
  }

  async setAuth({ username, email, token }) {
    await this.state.update((value) => {
      return { ...value, user: { username, email } };
    });

    Cookie.set("access_token", token, {
      expires: new Date(new Date().setDate(new Date().getDate() + 7)),
    });
  }
}
