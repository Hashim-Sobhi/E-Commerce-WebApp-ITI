package iti.jets.model.enums;

public enum ShoeSize {
    SIZE_35(35), SIZE_36(36), SIZE_37(37), SIZE_38(38), SIZE_39(39),
    SIZE_40(40), SIZE_41(41), SIZE_42(42), SIZE_43(43), SIZE_44(44),
    SIZE_45(45), SIZE_46(46), SIZE_47(47);

    private final int value;

    ShoeSize(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static ShoeSize fromValue(int value) {
        for (ShoeSize size : ShoeSize.values()) {
            if (size.value == value) {
                return size;
            }
        }
        throw new IllegalArgumentException("Invalid shoe size: " + value);
    }
}
