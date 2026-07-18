<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherReference.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCykY0l6MKbR9yPvup2CGlSo6gAXlTTC5BTVj4U4RlanBDuirZMcVIkOZ6GwTQ5SWRXmO5nxj54gwPn8lLXQeIZQCq2ywdX+KcucZbhfIbTdQ=FastBusiness.Encryption.End">

  <!ENTITY f "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7E+jtHd4Yb1fpUl2c0sa2x+vdXJQJwlRuuiRSP4MaRj5IdMdqHcD/ERFhLDTdByP4yqJ9BrldRtL0G9CzM6q/HrWzvjR3LvdoMYkQNFvGZgpgY+GFOZFgQ9Z2o2DJRdI6B/EPks2G1VhRv5nbd2msRo6sg/FSOn1KinkQlgQaptFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2vWhZnPRBgJpKjUDuOTxmXEZTFrlT1fwqVVW3EThJkVsFastBusiness.Encryption.End">
  <!ENTITY k "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/i1oL/ObbbTQfn+wyDLNrZAOFmRRSyei4wv5B/qVaKyH8gRAv8QmFMXptT2scGCONKNqCUfXjz9BA0jxKLezD8Lvs9eltUwuGGlSau1cHMiohbItdI61LnJsfNAM/q6ABQBL5/Y+6S7k894eszxb6DbTrmE2656UFzhg4r7RSKrFastBusiness.Encryption.End">
  <!ENTITY MessageID "FastBusiness.Encryption.Begin$E4BKuHeREgCMUX0Szdu2umKiHz/UyPOl3vkLVIz/2K0qh5oIiQQdALfCeqC/EQ6QFastBusiness.Encryption.End">

  <!ENTITY CheckApprove "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuxcOxVPSOGfpvZ9y6EqTn98dQ/IujEYWFsGJUCK0F7HWAVDrn62TISJsAXeLD/Dp0GNmUNRmt45IqlvTXvEUw23+Tv4f9oWkI7kQ8wxQkhKTu2OhO9ZFixlgf4PnqTjhjSJ5PGI+rbHkYRpL5oCJMh6FM01lSs4oP0ruYiQYA7IgqS4Isjy7vF+0EdTLXFr/dZe5rwzcZpf7cMt0PF3JxUYpmKOtuChMM9FdWeovFVVZ/ygEqypdfyqYeC2eSJl5fQgI1MQb+jHLcmBMeDJASMx9vEamQQXaxxbKhYcJ8JPWRX8a/Ot87Q7+mcUYV2CS9Qo20SIKrARvIIL9o1nN3GMg3yCbUDyPpd7E+Egr2BkrSa3rnp139U5U55vNnfJTeeoxLgNs/coQsoKgFRlSBsIHUWufarSX7Jz1zH5ui81AInTwonK3zw4Wd7Vp3g6ooM9N5oP6EDtfnf93IF5COBKbpXzONbcw95SfTHBkmsbeFastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$UrYZ8SHcAJyOME7Xreg4R+gL8phFYp+JO6semsgTd6TybzVy6yxl+Bhfl78MGpKg/eWJPK5ISjRjBN5xPrwTYjlsZjHppgp9nm0SP9mFfrZ5FpN5euQ99UTTVz7AwOGiTzZXtyuvmGoHWyqeQZwlZypbhMfEzmOhrpUzqcpQ2yN+RMuOkBisFlH1KkgGecqiY+wKkX3NMU5fZPZ6zsWdcMdObwDtqfLNpSiZA0jVTrOv8fmaOfkvHbUMQb8gdlQ87Q2hZ2XaRayU598b/hUycIWJ2qUkronF/1FyKuQNnfMxGNQhll/TNyojdg6feiBKJDfEp2u/k/blbMLHqqUplwrG3dJo4OVwwBHQYW7hX8Q=FastBusiness.Encryption.End">
  <!ENTITY Approve "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcOyuEfjbBMlls7fQBg/6yG+IBUD+O6w/Zxe/mp/pqdSCuuYXsvTfvlVJb/anh/5ok4drbekkyCYonw4diKjsLAnqi9ufDD7NDMX9cCL3hZlqKBFx8lZ0/wTLWDEx6wFmUEY3HYlQplnIbKUueKw5MCDsCA4RJyjshKyvc1AIDle9v8y45xgNcAi0LU+g6hE6vw==FastBusiness.Encryption.End&VoucherApproveLog;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu2NDcuaST5BsTN9vfMAo0jAnR+VbgioHCzNY44vNmrk5AlJ3PgJY8Xe0cpvfdl4fapTA67Jd432B1GxiN6a/K+JmlukcJzNTFGdzIZ2qwabBum07BS4Mxlo8o9LAaGa+Bczms3L+LQwzfLk1CKGQ3bEPerKBXOPp6VIznFR6gBFPm5e8pk5pO6+W8a15NMkYXlxOMR/llZ4nwIE+mE8B0TkXipU6lU++tnMEAmnFFUsyNBPi4W+ak/+t3zF3UZVggVPA9GRFlmBPjQeYWPEKAyupWZd+j9OeOuXwgyF6pYzPVT0XR8uG+VCqNrMPQuWPv6z7VXXMItHX/QalHBTqGISUASk4qeFMD6poS+u6Nl5x21tXB4bvuj9fW5cAwObjZamG2B84fzUwPHXQp/s+4CLGIpR3NGi8xeSus024NEkNuaevnNUqw0EzcGFdGXNrhWNJPCSPJsDu/mvPIPZPeh3m30XB6++7zFZQtuc4r+GEFastBusiness.Encryption.End">
  

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "02">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyPRTran @stt_rec, 'm91$$partition$current', 'd91$$partition$current', '#notifyContent'">

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PRTran;
  %Extender.Ignore;
]>

<dir table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" id="PR1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhu cầu vật tư" e="Purchase Requisition"></title>
  <partition table="c91$000000" prime="m91$" inquiry="i91$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dept_id" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người yêu cầu" e="Requisitioned by"/>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu yêu cầu" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" inactivate="true" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7k5O5X+wgEC1J/rtYldscXTB4hHMYKzspHSFOBmRtnKF+RHaq5+6oXfSG0AcrOfsU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approve"/>
        </item>
        <item value="5">
          <text v="5. Đóng" e="5. Close"/>
        </item>
        <item value="3">
          <text v="3. Đặt hàng" e="3. Ordering"/>
        </item>
        <item value="4">
          <text v="4. Hoàn thành" e="4. Completed"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>
    <field name="ma_md" allowNulls="false" clientDefault="Default" defaultValue="3">
      <header v="Mức độ" e="Priority"></header>
      <items style="AutoComplete" controller="Priority" reference="ten_md%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_md$dmmd.ten_md%l" row="1"/>
    </field>
    <field name="ten_md%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="u_status" categoryIndex="18" >
      <header v="Tình trạng duyệt" e="User’s VC Status"></header>
    </field>
    <field name="ustatus_name" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="nguoi_duyet" external="true" defaultValue="''" allowContain="true" categoryIndex="18">
      <header v="Người duyệt" e="Approving Officer"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment" key="id in (select distinct user_id from @@appDatabaseName..dmduyet where loai_duyet = '1' and status = '1') and status = '1'" check="id in (select distinct user_id from @@appDatabaseName..dmduyet where loai_duyet = '1' and status = '1')" information="name$vsysuserinfo.comment" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4b70ofgultKDz4MrJ2GNNBb5eMmQ2mVj5mnh3u/V+vUCQTa8mHA1hfga/pDLpOFec=</Encrypted>]]></clientScript>
    </field>
    <field name="comment" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="user_id3" type="Int16" hidden="true" allowContain="true" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="d91" external="true" clientDefault="0" defaultValue="0" rows="216" categoryIndex="1" filterSource="Tidy" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" readOnly="true" hidden="true"	>
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" readOnly="true" hidden="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="xs_name" external="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="t_dong" type="Decimal" disabled="true">
      <header v="" e=""></header>
    </field>
    <field name="t_duyet" type="Decimal" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="kieu_duyet" categoryIndex="18">
      <header v="Mã kiểu duyệt" e="Approval Category"></header>
      <items style="AutoComplete" controller="ApprovalCategory" reference="ten_kieu%l" key="loai_duyet = '1' and status = '1'" check="loai_duyet = '1'" information="ma_kieu$dmkieuduyet.ten_kieu%l"/>
    </field>
    <field name="ten_kieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="276" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100, 0, 0"/>

      <item value="1101000000110011-: [dept_id].Label, [dept_id], [ten_bp%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110--------10011--: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [loai_ct]"/>
      <item value="1101000000-11011--: [ma_gd].Label, [ma_gd], [ten_gd%l], [ty_gia].Label, [ma_nt], [ty_gia], [t_dong]"/>
      <item value="1101000000-11001--: [ma_md].Label, [ma_md], [ten_md%l], [status].Label, [status], [xs_name]"/>
      <item value="1100000000-11---11: [dien_giai].Label, [dien_giai], [ma_dvcs], [cookie], [ngay_ct], [t_duyet]"/>

      <item value="1101000000------1: [nguoi_duyet].Label, [nguoi_duyet], [comment], [user_id3]"/>
      <item value="110100000000000: [u_status].Label, [u_status], [ustatus_name]"/>
      <item value="110100000000000: [kieu_duyet].Label, [kieu_duyet], [ten_kieu%l]"/>

      <item value="1: [d91]"/>

      &ListView;
      &PostView;

      <item value="--------11-10-1--: [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
          <header v="" e=""/>
        </category>
      </categories>
    </view>

  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlURg5bznQJQ91SCj9dgegzhhy7VpXKDfgnloczJYFCJN5FvROjlfT3ROJ2vuauEd2xveVl6YAvd5Vd7Hp2X12I5z9yxiLd0qFaWzXNzjA5ArYoUf9jM63REoRzrH1NGrjJ/i2dGOTEGI3gISCWBoWUiHu4J4gKNotkt/NPypp+DSN/NC4IOzfNysqZKS0bqWyQepiaXQySHpA1vWK9wOAO3IGP5MZpG15wWTkdMRELeCsBZm/AcYYAzna+pHjdaZQ=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafb8oYUyEQfsYVvsqBmPpHB+N45iffKBT8jejfcvKjn2qbj2/n/n7ZFeNBvPQhO1oiAYAF6aUG5a6HpHnbMhsUgVf+z9QZeEeiQ+YickETqpbsWKYWEGxkwkcLWr2wygJzw==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ07yvFm3Ks9k2aeO2EBtmStPXaqjLE1vKg1SK2flseouhk31E6gONWMPWvn3VpVKPZWPPyVcReXOy9+f+s7a6Iqk7t22n02sUsHYMCYLkek7ewoPn5NkUy0z56FQz99Qq9sAUkUgNBLABsAuDL/YxvZbr7Bu9XjmXM0zkANBA9i0NQkE4vZ571p/2jKXYW5t+/XwNbMTGueYZXFn0grJ4zyngR/1VjPCce26NNaIx67D1PjeaSPsNQDrT+5PgPZwacaVlXN6RSUHR0h9Xtu9Mxkpg2Ci+iAMkJYp1CEDlCY7QoeYHWVpbNUtyXGHCykTafg==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0wPDFl5vrEmwDK3BdYupn2BYjkOkFUo0RbW+MraaG7sKfIhPrCm89ZuzXh/8PUcGiTh2OfbBprPH6c8gMFUtCo85goUd4rlXmVPL38COfErG</Encrypted>]]>
        &CommandExternalFieldSet;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFPQdQ+xl2GI6SnRpG6//KShhWpBWrsmSXibY6ytxB6fc9p7ZU6fgseTflJgF6pbMYMWAa3Zak7LcrZBb6a9GK0mgb6hAbPrpz3LJr9IihXOFKXsjEOS8iM+uBqaTYTbcniOsBoXJMIZ9gS3Ym+z8xvo9ZeaTtp5W84pwmaL9Brz</Encrypted>]]>
        &f;&CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05jFI1PhcapN4yZi8nhXoUn9xQZhIdN2oNKH/fqSQhfb/odcNpRhVDZS224FTzS5Jw==</Encrypted>]]>&k;&CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05jFI1PhcapN4yZi8nhXoUkAkRCdqbjmzndpdP/qj1fdfPJN5Tn53J19aznRsA42dDfhkvLFtuZiY/qC/cL5lPc=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        &CheckApprove;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxvv6gHAiVlPuEVt0VOpPlIRDfo6Cb39xPGBCT9QjldRZy4dSzZb9SlcRjxQ4x91149pIHxP1i2W5gwAmKnNViyv8xzcfio+RUteweyIRSZIXN6qSiURER79QQgPP15SGJ2/Yx5jbsATOTLT1iKJcdrrSq2sTBuF1J72yrbuHJLzT1qRvueww3HDXG03oJ2y37csxaw3neiXBNTFdfP6OUL7pbzrSv1f5aOlttHMMawZs=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&k16JMzyEY5QK2k7AjkEOOaxLvWCU9fuBbP5OWG5OZYt6ERQRXSzF2cbih+EOEw8UxAz5d6Rc5fKoYwHKc8flVrOO9koM5sfZ+uPksuQGteI=</Encrypted>]]>
        &AfterUpdate;
        &Approve;
        &ListDeclare;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAXxdbSZgGmKjROtm++9DCoKlV8yinq+s+gSHnD7IWpu62LcIB617rV2rwo/2sW8Vlo7dIhSqSzSCMD6o0QcuABh96W4xzK4hl7Nry2sPqvhnDP0jwA3CLeH0BwRxgifxP5s/eD9VRzS4gZZ+Q0wISJF5QI8zPgXF/AOIMbgwHQ+3Mokr9ta67bSG89JyrtrAyhnpwj2LR4Jgckq9gEh7nf/YkuIp0NLFJg8AZogojk8oLe05prs7mjqj+fAdfhN1DOcA4nQ5Xp7T0W1agUX2pprmGPrC6OLVbj/U3weLBTpZnHDs6t41U5tKrLLQjnKn1sXTjSxOB7tQlUGXfGxXU1nGVJAYjMXNh6kAmyVkHX7xaRqwiN6eA7ejimoVZUwPtN/PyzVOrOEqByW/frNu+L224COEVc7pgWMQfm7zT1Xsa+jB4oHbZLxSuKezUn5X7B2VLhoaE84DLOyKyjPCsVAAqaIBSJ/0CpX3uNTn9jnQw9psLNtLMu5tY0G7LKnV5G3Du4JVsvLit9tc+UEukfd4GJ0Jjt5ZOIFpxFsrIdmhlj/AoUQtfe9YkCV0hnhhTtE6VgUSrOyQ15Hq/kbBLV43Kvm4UOpij4DN8Ap/z9wLR</Encrypted>]]>&MessageID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5XtoUU4blKG9/ssgopM0GGGGsGkvUUiuNfiyjpIGOgrvrmxPZy+Zjl/jj9/Bwn1G3SNxRiduG8MVTxb2tmUqAUBCdgd+RRH+tecmMsj+M1XacdW3y5eZLVtGYKsmd2lavXIq3qkgbZTToqL64CmgGaNS3sYawMnvimSENzG92k770k2JCE/5u7oIJrwN5Q5C8A==</Encrypted>]]>&PostNotify;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TQy4J8jh13T3GPqu9XfddYjsMxZZE2KkFE4UOP/g5nfw/VXPbbRLcYzZXmtvKVvLvomm6HJ2LOLAJ+jGzTxJiKHLF0CAVpPJWOHCj6PEsvD9KaMky+V2lODTJq+7AXa92Pt90dDHXpXAz2FJsZC9U7VEXh3j6ml8BFQhad6ux5m</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5N0eb/gwHpOTKUQNQa5fobu/Dd1cNu26o3Q60evgqezxEoQawoOey3I0ePCbuF3b6ztO6zeR3As1NNClKtKlIpq4RE0FF+vBcnUSzAjIGjzfR3E2dlnt9d5QyWhx2SBkMVIW/CA9LcDQRDSD/S9UXzdutIRsnlA91QdIQjPaAS4CDW8t4V0zRpLevyHVsJn2A</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CheckApprove;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuypveM6OlIFEnW6Aw8mx/UYOFSqKke61+BWVEH1L7i7BkkqnXBmC26A7jowA4Sk13xS/xN7NFECWqHn7T7TF7y4nohFeqXhu6c0vDEGWovR75qcp6dzZB5cX1FvnsiRvkDzXjTXmi0Bbs2YjXcckZfwfOTm5jRZlDeMId3wupn5L0z9fk51IxAfCxSfYmQBrhcUZzOg8jHfB0nRtHJrwDv/4k+0sC+MZ+WvdPLqnXQUM</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Ysh6z1Rrnp4UMAawjKm7rYskkvaYeYjs0bw9a3S6U13rOx8Jb7TYjBn6olea4/YRl2JHfjsaTDAsEft+pzjaPifRitBI+rBbVzfyvcRxvJOQmkRJKiv1nQ7MF0Rpw823G89Fbb2QxS+lBOnj8JTPXBHeD96J3f1QQtJJuDrTrJ38AuIsF+fuWoScnhz2dFyWhlsYiBw7EVZI3Z9OBNl+oP+DYfjZ6qn3KHSZFH9hc2J5eYRLZvN/iY60G9OeEECcDnLG/uu4OqbpC+I5RqC7ltibbdQIsZq35496mAB3CcV9LwtzGyQepQ8vwbmVtJz3D3SkvATOoWqlZq7362CmbCKD9GyrRGdaBL6tIiT0qw5Yar00q9jL1dBrFTn8U2xWBLGQTt9lrJVjy23EdYqRHHx4qMAgfRYPuL/XgkOVHHNyILl5G9CO8wk7IGDo4Tplg==</Encrypted>]]>
        &AfterUpdate;
        &Approve;
        &ListDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9sYDv1GbTt27xsJ3LI3x+HZyxfQgrYH0vOilrkKR9QA7RvTtCd3wCIQPdhA/AOKP4EW70Zll9WXrUpc/ax1/35n0D+0fXydiIUT9N3G75WATx7EnVPsMN7+qXfqt0438Us8yFa/D6zTX26jez8boozHjvUBRzA9+ywJGDFAX2IuZ7xjhaYN+HnaFzdun3yTsQCuHW3EUlaB2q32CcypEuYlA+/GNeCj4qZmA6iwlHbtX0pPXvxpYomIJQE6jZN6ybY3y63ml7u2uzwSgZXIcFvi0Z2vzvX9vbTbGHbYPNmN5jiSoXLEoD0+k9wugh20b2klnv0LHEhPOyouyY35MGG9JzjDgdCGHr8Ni0aZX2OGjCoGyiiHIpjWLsAUXYRVIA1StqTUjWaC2HHhmLN65t4nF5OwBOpijg+tscU/GH/f+0AqQ3XbXwhJx1HAj37mbPVsy5IiPHCR0F1G6yV+CoDKSVIrwhoxdBRX2yEEvPOsgHUtSQyuahbOQF3wflk6KnKU5m170exlr1drYoTmO2JV1M4W38KhVXXo2jITVDYNy6hDuKDC4dNIchmO41KMeA+XpcYL5DwUw6pCVyJiZKZHPSxHkea9j3/oXu4rljkwdKqGpQJFP2s1KuEPfk6kwAqRvvHXgCvHJnu9C2lt7eBfWQPqUB6aE4NH/5PpB/dkrW3NfyPA3GgfJtB2aDpcG+bVxLI31KkHOfc3Yr9PF8U=</Encrypted>]]>&MessageID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5XtoUU4blKG9/ssgopM0GGGGsGkvUUiuNfiyjpIGOgrvrmxPZy+Zjl/jj9/Bwn1G3SNxRiduG8MVTxb2tmUqAUBCdgd+RRH+tecmMsj+M1XacdW3y5eZLVtGYKsmd2lavXIq3qkgbZTToqL64CmgGaNS3sYawMnvimSENzG92k770k2JCE/5u7oIJrwN5Q5C8A==</Encrypted>]]>&PostNotify;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UnQjbh1dpbg5wztv2i8Z1IIk8RKU1SS3T2P6qmd55JrdaXcnfDOd/zAjzbBNUlogb1FOHvCbSEGM0UHfjAtZWUA8YFbttGAwz6sBpbbr3PFk4o4/LW8Rt3pK+3uaquKFwRnQ/REg8sd7s7XFpdfBaPiOdZeImn7Pg/xspIYCzjhDRU55iT1/n5JwBBnWxynrygW8rmPSmCgf1bl0nt6pHy56s+uUaYuTSOrZmX3wHRq</Encrypted>]]>
        &EndUpdatedVoucherNumber;
        &ListWarning;
        &ListCommand;
        &ListQuery;
        &CommandShowWarningMessage;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5N0eb/gwHpOTKUQNQa5fobu/Dd1cNu26o3Q60evgqezxEoQawoOey3I0ePCbuF3b6ztO6zeR3As1NNClKtKlIpq4RE0FF+vBcnUSzAjIGjzfR3E2dlnt9d5QyWhx2SBkMVIW/CA9LcDQRDSD/S9UXzXuLyfZbRTvr5mX0Hn2l4PBrA3dhUkAPsKpB5/UNwNvl</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy0wBPb0+fjZYcOeNtFcdFNPZ1U4bz5TzAtp4loKjNd1PbesnNLQSA0d77C7jqYFufbpiikDC3GneSigBw+GtsdwpeL3Dt6bU7KZ+/NlSYE685YeyCPvyYna+8x3eCyhecrJ7fmkUsPYMhxBpfeTacmlIfc8QsgL2yJhMHn5Xg9FrO07ZNiwHT4P6mAOl1W725NWS8pME6N+4Gg2WRINXhaOcBEQqYm5jLdRk+Wo6tfGwQ8TpQ1CEhowoPA3tcKrHldd7h+NPpPZunB+E02aIxC4CvLndH/0GF1W9tLDiUFtvWb4F5OqaB6+Wvma+QE5fsMgEp95E3GG3/0rHUSs9wKn5CC5kpJCnPl46IUVgLM8QhNSkZ+o6QA62gH+pgiTF347yC02FsTUpw2/bBWDm5L/mb/W2wdt6mz1+j5Ktc63MVHv5nwIoYD3cwIiZV06al9Pmggt1VtGVXSR2feZGpCtSaBjqi64e6a8FdzXyohQGh4GYzwk7hGvIW22sq/lMg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxZq54dfxL00iQcp7OzF/hhVyrQPElkw6bGmMg/+qZhJRUI+W/JDh6pL8M/QNSp0ZWo4W2KNzNbC/QYmLrj45d0=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q4wGordcTSVTlwzpzWRRygwgFqu326oRCssaVzeozC9LC+VB0ACm/sfv/QmCy8jaSCauozmDu0m/RniiQ5X0GPS8r4uh/ZxaVo0SJ1zDfPzHz10j2s//WBXFYdfThMe8UNdLMacESig4mbBicNJigAr7PMksWUNDfaQmvef/Qknnw+UKPJobZ90JmHzZ03CeA==</Encrypted>]]>
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event ="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTAV+V1K2oQ3T0pK8LTuPSYSzvEbwirH6q6NWh1qwNfkUa0CH4g1pXQvKAttq7k64zGXpZ4lmU91+LZcPOZG9Nn3G1NqZxlY9wWrMF06HVZHxXC4j0RASLMl+Eoz0vhzi8gPkiWmWqYpgLuE4fkk8QRQhBJZxrPmGUW6pU/RMp2Lpo/zcfxYBTJrf5B3XqxVBovi+XbGA8mvvUyvXX1F4wRZOlRM/+CKiFDK5zxyHZ0HHgEflPOw+W+QY6cJQ/ptWuUzvNNITP9RciFv7D4CoA9ph5Vlfh3U4z4yyTZtwLv56uTNREFOwiN9wem3DgEWX759CU1PAG0E4RnYxnJWaX2736fwPgoCxo7QDiR2sPj6EPTVri9ZoqH9T919YjJOyhjTgANq7mAmPjwL2lINPjIKI5x6TcMqFG4IU9f6+O9lKNbqH+7tYQWYQ5z4Lg5vNRNWZpAeeLwpUa7r3olaVfrpa1T3E52xjm1KmMAYGN9nFexlRIZ8Bdiw1U3QLMFKI+TeXSyHOvIsZhc+XMm+Y/DYlaBlMDnTZTake6l7BuydzH/6AhuQbFdB2IuUF8FS4GFIdqnN6yBLF4EjjiQ4YpLahZNspSmiRtuou2YN3ckCJz0A2OTGxQPER+qjXdaSmfCuk6HJlsKrUrubxgcGLys2hvDJ143H7x3Um0a68OhJdjeL5Q2bl4sR2R42oPys1P8/DXeqaxvuA7idDMXvBrm6SpF8M1/lGzT7P2b8UtaEgdr6xxKGiOGIVgCAf87RCChBePM4CEd87gHQnWu2r9hMWOIwCOlW1JbySh7ur873zuP01lesh5eyDlgQdwNHoratFYgAKfpNKWsuzdwPf+WQK/vTL3I819einS/uYY6Kilk89jysX1vL2+zZFkmbuM76xvJX2zAwlraNWY0gUbPf2w7ApWuQlWiMfhFloUuPCKTkC02CohmoL1ntvgEYseCXJlqGgBIRl1OGNMayIHS6c0y7ekTmAm1eADSBkF4YfA8cjSbAbtaYzh1mrZzRwolfLpoeYWkCnlgvV7Q9etgy6yiWnnyKlfu/RicBIyuBl</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>

    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxe/WQx+bwj5afl4LxyYsF4ekgdjbd2/3WUymx5aafucJ2dIXbkDkKA2P0gs0rMPonCybETYdCmbTyxHEdXpUxGVw4PP77SqACnXzZQ11M7XdA==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ejDuUfIQkpT8MHdAbNBAvkAW0uPCbsjgrj1QoyL4MvKVTtgkVxqFXBpva9D7aTyYj+wRQlwwONUShI0PMBhHEUNxPMAIySme/MJH8rP30jhoi4opTTszp4ypfKy0YlF+hz158p7rPCK4HcdCOqm0VEx1A+xBD1JRgVS26LJLPkpDqoyv1YUHtdomRlap6s4g0kTcKal0NN6WJU51KOvKTL4lAvrgv7bCuF3uFR7XY7/a/MTldD2EUVp9fKcSHCfwGwftgwKGettU5CutW8BdlI=</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHJH3FB0oUPJZzbSaD/pW81TsPR/+jh4bDqgJh1JDPO6Zpss2Zzjl7H4C7s538PUvsKCiezfDlepklj7CBzRbBCIm3gMgavH4D/qgbM7/CexeIufszf33lz3CIwbTKFV+UgBayIvoOjbu7OyczJgPm4qiKzEYaiySmrZZ3zGy119bWH6MSl29lFPiFZKYn7N8os=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtMtU37LUaItVAxKgVUWU77RPCA2veb81Rc1NKP9GdZVdDa6Uta+s1kNpxXQxo0WVGpAHAR66b3rfzk2PTDRj7ofK7drrX4anZSIDm+1D0zbRWJb6wTu6cVewJqGgqoKnfFH8948bd060efmijIbFtsqHsBx+Z60bGJe2UOtssSJZZHxme4yp/Ws5ry8EaSaOy</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFwCUoju7saw8woa9ZCLE90Y4VIOl/U/eERyF6UrRt5D7EfdKoEbV7jvBCq09b2DLi1pPw1ZjMGRxMiJ724GQgVwfcy5+GnFwao2IwHRIvGG+Yz7WMwCpvQyW2EyRlRRUFJlDzxJZbFCcAsfLXXlrDvQZtCcO3eQGs414luHD0Htg==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbIkksHrI5X9H01eZ+7niFsbI4bsaJ2QyFy2H1137m9u+AvPW7ch6Mz3IEA8d187j5lMKDmzcpqGYvHpe92LDBFSRfgC57qEAvT9HLIl4WItWn43kTmf8hZj+Mm2pcTUhJTWVA8R8KQR3qAO/GqizQmAvWezyPpVd2xY3l3+64Ch5pnOZ8vB0lVhfhGAK//yf4nbs0ZsEglcWgGydpoi7EOyvaHJSoOT8UGptFJYGjwCV77Q+vJwBq7rw07EOiW+AMfD6Ty2uY0z5yVt3VkjWEorboLU9l5u0EjnIZQhDcSoMqcZhsk5XZLnCWXKNSieSO3eL7f2QcrKqQACo79mOxPQ==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOr2MLY2bYw4Flxo4jU5Y2bgoZ8ED3VMSJbVnJrC7+hOi+eUyWJUdHCEv5z/sO2JVjV/838yc1Fj4xNMHXLeSggY</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKHwbFNNgjNkN89qbwhOe28J4RUwETs5hZKmVA5Mi5bEBw==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/781Yq6OfzEVNL8ObBCq1fpA9Reg/dOzLmCaY8IH9DKrbz</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPGiwISQDhmcrrV4WqfWYQY65H7+xd9mNVsc4Dzw7yjEarURSQ6GiBAeSFdW5dxFmJMh/LxLpLrf0za4QPxJwhvEt1bsBHbAAT4JNYIa6zFR9QppgQYBptMcXKDIyIScTwMX44Bzsi84M0sZVo5df9EZj/zNZtjPn4smQRT3ZhzsgzZnsFYtbsJNyj1lfkRfJCu1uYe5VuWj8aOyWlVhSEm</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgmAexscGIb6XmMXc+/kA9N1Nxy9w7CZRaggCOPybbNWg==</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VGALXfw3Kc8Kk3w3FYNtHC0mvevEviHCNElxwFxOJA8</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeJO3vnhb3QqwkEVVZebKc712im7cbLnyqIXG9+qJYWuKQuJOIQhJE8YOJesouYoL4ezICNQ+riOkotYd8oHh2X</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWaQMzjYm1fJuXTdq8HYCnRl5wl2JB8Jg3oP60EwCh8J6/E5mRRDGwRAq66xBxlK8TCQ4Ir6HtdJV+AjHKMAQfQ81iD5fbgIPZkJbsZXcV/SlAj9hEzW9L25KJHaaOoDcEUqUv+xvli/lm8cTYNlFIwDZSmKUTd5QFjXLbdHoyz2ncnvb80sTE4NgOd4rZoedk9Xe/5MypmpjawtF0a1WykHXztwuYpy+e8NR4WCdzGE4/WcPS6smBVXn5Z/CiG7jrq+pcxfQi1BhDbeu4TtBWi+naQGSnXuoujPkXsLfi9nCzgddEHBKa8TR13DiF4vXtHE9P3cfwAQXPy0axIbwJlAC5yU9jAQmqnAlI0tOVM2xkHNSTuLU66eoxzO3BQAsgTRWKuoD5tPhCB2albDs09YKKnYucH7zxSLaCBGm6vrIrXMIHUW+/YkNkIYZCxaMGLEUzlLeWUN7bVkhfCfGHHyoexwZxfiW1+m8esq+FfHdSpHW+urhP+qZHk3CGgWxtNL0QlzKINJsBOnsEBkTnXbVDOKTKdrevkqRvh/Ig6IR5yKB2apznb37KiPZw9HK7Bdk9vpgPqfc2FA3XC9QuSYQl1B2B4ASL3OFvZcHEmf5dNJWoGce1clhW1S9USfiCRlnDLceVUiwod4/UlM53+TY1XlgHlrh+chWhHGjo28zneeh1oxXHVnUioE8YOFVusxRDCWZ37nj+irQ3XR2rTEETiaLCkSFDDIwCHtEeFTVP8IWGPJaAScHIvAtM9+o+TqsKuNC8I4A9cd9YNfyLsF/A5gFekrPYyKFdsAKcIZQ</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLoOpiCbdYv/LJHRk0UatSDVEBwhcTw44AVXXdh82eyGmQClMs/8EPU7GZyCVTGjVrznckb8cG1EdtPQNeVURAdJNftLT3sQbTIUHRGC+TuW</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>