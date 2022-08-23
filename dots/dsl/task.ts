type Predicate = () => true | string;
type Callback = () => Promise<void> | void;

export default function task(
  name: string,
  predicate: Predicate,
  callback: Callback
): void;

export default function task(name: string, callback: Callback): void;

export default function task(
  name: string,
  callbackOrPredicate: Predicate | Callback,
  callback?: Callback
) {
  const result = callbackOrPredicate();
  if (callback) {
    if (result === true) {
      console.log(`[DOTTY]: ${name}`);
      callback();
    } else if (typeof result === "string") {
      console.log(`[DOTTY]: Skipping ${name}. Reason ${result}`);
    } else {
      throw new Error(
        "task(): expected predicate to return `true` or a `string`"
      );
    }
  } else {
    if (result !== undefined) {
      throw new Error("task(): expected callback to return nothing");
    }
  }
}
