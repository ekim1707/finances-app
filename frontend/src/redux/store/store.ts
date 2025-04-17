import { configureStore } from "@reduxjs/toolkit";
import counterReducer from "../slices/counterSlice";

export const store = configureStore({
  reducer: {
    counter: counterReducer,
  },
});

// Export types for use in components
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
