<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
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
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY ExternalInitVoucherNumber SYSTEM "..\Include\Command\ExternalInitVoucherNumber.txt">

  <!ENTITY % SplitIssuingOrder SYSTEM "..\Include\SplitIssuingOrder.ent">
  %SplitIssuingOrder;

  <!ENTITY CommandCheckVoucherFlowBeginTag "exists(select 1 from d66$$partition$current where stt_rec = @stt_rec and (abs(sl_xuat) + abs(sl_hd) + abs(sl_giao) > 0)) begin">
  <!ENTITY CommandCheckVoucherFlowEndTag "'$NotAuthorized' as message return end">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "if @@view = 0 and @@action = 'Edit' and &CommandCheckVoucherFlowBeginTag; select @message as script, &CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "if &CommandCheckVoucherFlowBeginTag; select &CommandCheckVoucherFlowEndTag;">

  <!ENTITY AfterUpdate "
exec FastBusiness$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd66$$partition$current', 'stt_rec', @stt_rec, @@operation
exec FastBusiness$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec, 1
exec FastBusiness$App$Voucher$UpdateGeneral @@id, 'm66$$partition$current', 'd66$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec
update @@master set loai_ct = @loai_ct where stt_rec = @stt_rec
">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.SI2Tran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" id="DX3" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lệnh xuất kho" e="Issuing Order"></title>
  <partition table="c66$000000" prime="m66$" inquiry="i66$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="ma_nt" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="2">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Đề nghị" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Xuất" e="2. Issue"/>
        </item>
        <item value="3">
          <text v="3. Hoàn thành" e="3. Completed"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d66" external="true" clientDefault="0" defaultValue="0" rows="242" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SI2Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="6" split="6">
      <item value="100, 100, 100, 37, 100, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="111000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11-----1001-1: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="111000-1100--: [ma_gd].Label, [ma_gd], [ten_gd%l], [status].Label, [status]"/>
      <item value="110000-----11: [dien_giai].Label, [dien_giai], [ma_nt], [loai_ct]"/>

      <item value="1: [d66]"/>

      &ListView;
      &PostView;

      <item value="------101011: [t_so_luong].Label, [t_so_luong], [ma_dvcs], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0" anchor="5">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &ExternalInitVoucherNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSx7Vg5lN/0PGdwLlC7n+zOJF8PrcFlSbxYxkjuywYO1+jvLn0TrxBsdh1AyUBSW0Gb1YxyeWeU3e73n2Asa1LOjrfqUue8LCe+bbzsj6BoK2Pc8Qo/4/SRakEdGBnO9jkD1C+558xUkELYn0uDC+T1jQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDsIodCF7NG2rFl9/oxHpT+hSaTah8bv29iSwArWU3D1ur5c5nZFZQ5zoCjtJ/Lg46dWb1o7N256mxqIrclyFZ8=</Encrypted>]]>
        &AfterUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku2qML/rj6uAFyANY8O5CW572OzmpguV9xaL+NjDHor6kXhMt0XyHZh4Wv4Wlhta1ay2118D8E9zszrtKChwDIG6d+YmTbJoXCuLodk+Zb9lPBmsCEIoH9t7QICENyGROoRviCrEltlMILaUSF5wjPA2/DE9n8aG8ikGMocwH4T5M1Gx0RtkbPOq+XKbS9qaTlRk2ahEtKMw0PbbNB3ktrWY=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a2I4qCnVSxKSULpU53D8kYyM88VrwR57WXZ9lcdPrxeJkLAaGIFCGg7yM5r+tjRvnGqVJVJCXid1cvTD080TuMSqpS9TqMyHAdfNpKQQqgrQA5wvgcbHIHNyKT3sC2Wka1oDiHGm59hrHq4A4xX9r8wr1JaldRy9o/T6iOSXW49+90lUOG6cANmOOHVAgOZV5DYvtBeAjV+1B8I3wK3b72MPXhywjWb9NRKln0+Nw3WQsADjVLQoMDxqB2ZGuDQZw==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandCheckVoucherFlowBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxHJsfQSAWqubb66kNSEpWAoVfhIjp3M2kqsO8b8dScIrwQRbRQV8bIP6HZmFedjv/3kU0UvZUR/gqwvWitQKfI=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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


    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkAYjjbCQqmLFMh7B9JOyKX52rd0XL8/Mvypo+MHtZIzwGuOBK4fK3gRUSwpszaWdLy5aKahgbyypbAwYm9zudZWmToP+Q9njdZyds8dZTQR5cL57I1cOwC6GIKqXv8XId6rlqu6oLrc3GAU8y2IWpPMAkwiEwiT93wOago/UIKKovuh5pFwp38wbl4eVNTIxHMSO53+HvKOwnuHLHisWCLthTNMOyBHtHSF/UxKMmwU1Ufd2ol4L8rRymcPzBWN6BSm7a+SyNBbxVJDlg0dxw8cCN4LHkijgfr1Z4ZUV65SdV3mPYgx+PQ+t/0yLdO/gRhgIN1OQrNGExsbhcSXagMLE39yHBkyG9/aeWxwUmaVMAryCz1cwtMmL8pJWfi4Vf9Y1ASrZrXbmx9o6sC5GQsg7xv9+OcwE8yfajpOlfdShOUkhCZ+OVlh9f95A2movaa6/kC+oGe0n9689XhPeRDsTELmvFAUeM46/EvtDrHCkLaUaPEHDnemVJQOD1jovdYyy8gX0BfEBYi1xImwaeUVEvj1PTxB2ZAb6hKXOen3G1kuf7+suyCCJ+B08RDBZ6ImVhcVVvcQla9T08YS0azJtgSYeht6plapEEWoT4zRMCZCu38Sw4LuSD4ykOAi+llg7q+DrFBDePYxHh9uBJeFZ/ZEyiUhuF9KF6ne2pWI4mlOLMMFtdI3iq7aWutINUQLbx4aXvXOm+63KkZuBTHkELOP3dX0OMTOPChRmtHukti0GKg856A313JTwGo47jamZ0JJz3l7ELCwU7bhEx1TYXisR4BXNfG+jI6+PYob8YudjxcR5N8F9TG5r3tf40bjUhlIe1s4FgRfRcsyZ/WpS995YrGg1TWeheCVx+ZSdT8Klp92IQ5suvI0KLuaEso2LMXNAB5xyCqI2o3Fxs8l0IsEvzzsyu8GRG7cTjB/nazZ/tC6frpVI+bAXdJ4to3eCw1vKTnwbXHHaEuBiFWN</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3b9eoc+RYLbv1ek/B3ubB9KZB4ARTIDZ5YIZBtWoeeMAsp/qaZzumNqO9FPEjKFP6Hz22GVYCtfu+rVIdqJzDFmJUTyuId7eR4nCf13BJsTRcSd+ogY7GYEGdXjcDfRljSnZV7KmZxaIfmU8UNSC9AgcpND0K6zSXLx9n5thkziC2RlO0iv1ewYb4qdeSrCaziSFsUihGRonPDPGyHfJlyr+uG1jCLlPjh6Zjr0fpkvD/r7r7WF6iUIDu5W1Hn5mzz+JFtTBlAxCHKHZzaBaGZgXmR78m8zuSwQGx7RWXFxdsW9bb5hLjYlrKuTQX2DIqy</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9VRaLsvvWsPTqdF1WOkotiIh4kJbWWMigp4+YwrLkddji7oh++8matEUJc+qOE0iddL1b8+k4hBlRYhEL2h5JaRooZYuD/U5iH6r5L83VS0bo8wHdQqhM/OH5pELt2DkT5GKvB+JIqiY+1Gpt+NmiQdXIYgnXiZi3as6ixqd98BhefhUwxas9sht/AEEdQJGRA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezLhuEmp37z6h8AfgOLwA2STlLZBoi+TuU+/vvE1YJXVczweZ2Le6gp6m9bRHvbnoQe6TxLd8d7z5JiHBeIpSJl3n+8ElvtVTNaBC8BZUxUWC/ocEsWshfYNTvLt/7HUB0H5GOjMBfc+I0sxpCGnE5i7NMEgenWY+S5vK1IWpxIadCtA1LkUUANWkFLMYCdAFj</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51kwk8p6X6AwhVqhj/w3oKTaovl+fbZLk++a09oj71C1iUToYrmY5092RblB10IfX1mG3kH35PHvxRR7agKiH/IffvSMl11pShd1+vT4sXK+Td+FyoS4t8v2eybmPYod9rB7HHfWC6JVLGIiDx9D9fJeY</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+45d73hsHaY0UF8NnB2EOmYFExZTdR+X/cVMhU1MQNFSJAGFKnsvLEzvRYPaIZeJ4/oXmcdLWcAfFK4cq87vEuN8=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm+e22mEDUV+WluUjsWEu+z0so/+vOMzCfY7LmrqcUlPAwdVld1UihDNXIuPq9vflqJfFBxR0VzvtnkiTwSz3a8x5ky8JlVR5wAD3OXJS6fuqNAPDIz5zrOdb4ZRvuY8snSNl8ggsHEikay+WI0O0sbr9qYvPCnXO7Pzwwl8R+KmIaq01pQjFJIHs0g3ZDy9LxxyoZ4yuwdWt0Tnh7szyqD8=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUE93vhS7Z6O1d7/MpPvjq/hVNGt6K6XJyxOxMfmrgyJyB4hgbetDfW+Ho4y+GkP3DT0NuJm4q9u/QsPpqrUstVpUTxmqo1Dv6P3/SK21NSZEhT4+EudheINOHGHp2RLpLgMUgSnqvEJ0xbhQuMbNLE4HVqrJK2LiPUGRJmWGjdkdfUaXFwwDwt2jW5HIpssaG</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgftk4Yr/NS3248iGL4r5k5rOEH/pMTZjo//rg+7MIiZ7YoYaUdOkabQ3Tg8fSGItdadI4DbKJnbA6o85fUUBGcjaibS6Q/320vuaTGV/HGDg+X/M8g4Hbm2zWutxG1zRtbTMp4k8n6fsVk/fHT9vkxZzToMyAnT/7c7xiae4p/noXKMv9HxVX1PfuslZ7VREXPj6HgLpFFPK4AiNFdkKZ5kaJneUkITwIhTdsRKxUnJnKlaCUwIgdf7iQ0AQbITLrnoZJbqih7l70pCYO/9EUAGuNYv0cK+wpBj83PnpjrS4N/AYh2u14lz47wjiQvD9DJAZ2/gXUX29H59OnBeXerxsjVdath+u+s7rhwuPp2J1LDEYQTdkUL1I7Gs4RbXj6r8ikVfQoUAP9HHFuU8eM4T+hThS+lG+jVgvBeMBt2cGxDNMpHO/VzqPA65wKimt4=</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &XMLGetContactInfo;

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgHO7O7pjAftezKEpSyV159qtkcDfFwet9hkt4N5OhYzgxlaAzZWdncu0LwOgO+JP1sJ4P1YjoQu58yCmwwMQrkA==</Encrypted>]]>
      </text>
    </action>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>

</dir>