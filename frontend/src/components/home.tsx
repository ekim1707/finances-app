// import styles from "../scss/common.styles.scss";
import { useSelector, useDispatch } from "react-redux";
import type { RootState, AppDispatch } from "../redux/store/store";
import { increment, decrement } from "../redux/slices/counter-slice";

export default function Home() {
  const count = useSelector((state: RootState) => state.counter.value);
  const dispatch = useDispatch<AppDispatch>();

  return (
    <div
      style={{
        margin: "auto",
        textAlign: "center",
        width: "100%",
      }}
    >
      <h2>Redux Sanity check: {count}</h2>
      <button onClick={() => dispatch(decrement())}>-1</button>
      <button onClick={() => dispatch(increment())}>+1</button>
    </div>
  );
}
