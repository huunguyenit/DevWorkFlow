<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY % TransferData SYSTEM "..\Include\TransferData.ent">
  %TransferData;
]>

<dir table="vdmscsl" type="Report" code="id" order="id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tao0" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày tạo từ" e="Created Date from"></header>
      <footer v="Ngày tạo từ/đến" e="Created Date from/to"></footer>
    </field>
    <field name="ngay_tao2" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày tạo đến" e="Created Date to"></header>
    </field>
    <field name="status" dataFormatString="*, 0, 1, 2, 3" clientDefault="*" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Chưa xử lý, 1 - Đặt lịch, 2 - Lỗi, 3 - Hoàn thành, * - Tất cả" e="0 - No Action, 1 - Schedule, 2 - Error, 3 - Completed, * - All"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_tao0].Description, [ngay_tao0], [ngay_tao2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCgYHErz2yBXx6kp9ODHBHEEedgxjC62C9SuoqfrBUT8ioxHJ+9OPk25fENmq2n/MZIDeSNXLOyL87jhBdyvUYQP/wgoUkEsomg42/HenKMt1Dd/EZB0LM6U3/nwkyrvQA==</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdKH7uPNEpIK3/E1XVyGFMgP2ueubWRuDDl9JKOgnRYIqfzphyDhKBFw3cXq1VAU+BwmY1u1tKh2sKNgmr+80/7En+NVAf4qcHzao8EzIj72xvyLQg3b6bdiykQQgxNIo0252O6aaLaeOEhrqUzfEaCvuXR+1JG+jN0wtWCXUhHLvBnvxe2EJ8dQU+oTzC5Nxgy0F+3xZqZ1EBsCG3SpTnwH4CXqYOb2GZur6dVeg5uxGfFnTxkhOMdUqToCVLUBKvyVHcMENRoRIKzx/cVSqWqdp9JrcNN9f2YHOUe3j4dGZHffjZap7/r1tNfMkJM2I1bEn/kPhhb/MLXFLEwM5fKzuCQJ7NRoUDAIR6X7liksRWtSgYu9Kfmm1RH/072snsDgbWdi01SoA/XQGNf0W/eGFkeRda7yCiRw1AL+duwRY0Y8YXWnWEXc+OAdJjPC40y8O/cHRmjRakaAJnwmgnoH1LkjSsUAIpW8wP+Szuji0</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFChP+jdpmkTc05b6J2+uR4i9qJRNYZEgW7waY7yreW0JaBFPqqTWOpS7ReWWB+At5A+JTN6ZeZHW26dzILddZkY=</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&x51xGhsaILnd6OtdJxQo/c4c5vffpFERLxMvx/X5C4VzyhXzmAc5SP0+1MmPNdNCsf4xhwn2YNseeCzOdd8CX9Ac3vzdILMgzzsxMCYsIEOlWgOhbGBkh4LTJ7CgdEVxHEWJSXIf5gapTe7J9dIP9eVd/JkGXiTi5j6vVDba6mTTZnUtu87VdmSCDIRPjl4/ueKJUtd1lDFNoC4eyFp8U1OPax9e56aSH7dX0xIt+kiQCouH+XF29efVB1sXBkliQuyYroyvya/LzBSlLPromWn3rcdlxWMXhverLSiHNjmfOsS0FCE1H1OfZ9JFQHo6OU62IlEVPDK5onB501UZHXaVaA/m7Sp2C2S/l6zUzeNrKRWAFgRkXqHZ/JpVLJsVNZPTBgVnC/5343GXyxi95d5G3qU9Tner8RH9ofn3cJg=</Encrypted>]]>
    </text>
  </script>
</dir>