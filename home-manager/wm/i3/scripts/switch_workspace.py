import i3ipc

I3 = i3ipc.Connection()


def get_ws():
    global I3
    all_ws = sorted(I3.get_workspaces(), key=lambda x: x.num)
    focused_ws = list(filter(lambda x: x.focused, all_ws))[0]
    monitor_ws = list(filter(lambda x: x.output == focused_ws.output, all_ws))
    print(all_ws)
    print(focused_ws)
    print(monitor_ws)
    return all_ws, monitor_ws, focused_ws


def get_number_of_next_ws(all_ws, focused_monitor_ws, focused_ws):
    all_ws_num = [ws.num for ws in all_ws]
    num_filter = (
        lambda x: x.num > focused_ws.num if True else lambda x: x.num < focused_ws.num
    )
    position_current_ws = list(filter(num_filter, focused_monitor_ws))
    if len(position_current_ws) > 0:
        if True:
            return position_current_ws[0].num
        else:
            return position_current_ws[-1].num
    if True:
        return min(set(range(focused_ws.num, max(all_ws_num) + 1)) - set(all_ws_num))
    else:
        return max(set(range(all_ws_num[0] - 1, focused_ws.num)) - set(all_ws_num))


def switch_ws():
    pass


if __name__ == "__main__":
    all_ws, monitor_ws, focused_ws = get_ws()
    # number_next = get_number_of_next_ws(all_ws, monitor_ws, focused_ws)
    # switch_ws(number_next)
