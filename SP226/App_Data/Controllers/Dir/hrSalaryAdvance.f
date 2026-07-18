<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY DetailVariable "@d05">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCn6eq89bbGMV657J16rLZo3Zp5+VAz7i9EQo4iYqORVfIpDwCsk/EzM2Rc9RgntDcs146PJAIOKHoVp0ixhOJYnXP9JPar/x+LBPobx0ZeqbjUiXXPripqjO/bvwA5OxS9oIcHO2PUgQ2s2ansxuMhelEjXnwA4rZYkMEw4O/gdg/1ivir5mLTgxHNLExvmED9eZgnoDZMz7gImAp5Az3pA==FastBusiness.Encryption.End">
  <!ENTITY CommandFocusWhenValid "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcMPiDOKfJX0YqWDNIaVtbdTLC5C4+VDnGKbuM9stjmDGWyWKK8ckY78MvLoCrrtgYtcl1bLfDcjb0DdwSLX/i8dzb8aaJZnLuMXAwZqymqYY5QMoHsG4KGcGb/Jacuoh3prxJcwz7Ww9Mri16LyR5/+ZAjd3nYrJe3GFqnOnun1dinoBMll+HMTkms1cgqkVlWPPK2x3eJPzPiGznkkKYjF4iowJABNnlAKXGEz+q6X3D+aMftEOVF0HFzwgxD3QCP4D9F0EFz5t4Jw9/w8nARo0fbJLiKNaFjaJiK/pRh+ZyERBJFeZ2qlp64uICrz1gQ==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$buUp+dpqA2y+Y5vD1ekU0ukO+XzRCbtq1ozzOg9R3KgQt3wXD1aTZabGa1wlWlKrdfK2NjsjYu40Oy/VIo+Ui4YzFy1ULbWffG3EOytGzkI=FastBusiness.Encryption.End">
  <!ENTITY CommandCheckValidWhenInsert "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcGn40exY5yDKc5Vr8VcD2UINveRduHEStCaLMemDbxIobvF/lt4caOtK/2rdSiUXQjN2e3XDOVJWPLkbhUA8UNPpbkc5op8niCLWO9M7nl3ugm4smjsw/m0F+jvNPh9csw==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$l9MWn/gPSBC1DMnBxxDWBeb439pIWxxqg0hUMavQpAzjyV8LYIyvrIEViV3OG9U6gmHDbMQruR3kQhQPca7jfyJ7LALVGg/k48eBnfTxpWb2Bl+oEGJmQFJJieUv4km/kTUP21bDj8e+RmGGRWefhQ==FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$tXP3tPqmqEs3ulRKS/wYp7D1HfKA1TlP0dVOdd0GHXKz/797jJ6kKxzugzOiZPHWFastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$+b7JlU7O9lF5y8awHRuxFjI+eMaVBPuAPA0cgfZQfHLY0j2cQD9q43w8jBQN6oOKl16Rc/e1LaobaG6l6Y1bWqZZm2ejlN0a6KQQ4vyHERlbobQSAGDGWwkOL8jQOZpcFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$hH16ORxCncxsnBLOpmo6eeKxOTcd8G87LXZQpcdaZfVRiJSiBTfkv/uZRNnx/GUdXgWr+FSH0aKWTnUoh67JXp8Kq9Zlz/980VnqpcGWhPvU2VOJoelk4fry5n3FJxlASbul9BEdma8WOKLVrqhHxA==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$PCWPRgUI9wjOZvBuECuS4lb3XWeriIjl8hIbWnHMkxk=FastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22fBk86UO6HfKC/Tm68cQCeDRvTKrhNL8CY0wbkScVo3OgqxaWnx9o7QK0xE3BuSzsA==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$TQs0CDX0qovkoki0iE9tM8RRMvQj9x777n52B7W2iQZbX95FQ1Du20wgbwWXOOAxW0bXBknl3/TMKCfwmTDw2nQLV9hXLR3k8JLG/U09UaH0SQ/LrpV7MuRP2wFwANvvnIs04Q6nyGIVaqt1qtIXpQ==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6nK204j4TmOmA11V0eJ3dv51DyrZtQfq3WXvcZfGAZBkz8Rpuwf20+93Yp6Zl6/sYPopxF9CqmKIrEcEYwwDRhE=FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$TQs0CDX0qovkoki0iE9tM8RRMvQj9x777n52B7W2iQZbX95FQ1Du20wgbwWXOOAxW0bXBknl3/TMKCfwmTDw2nQLV9hXLR3k8JLG/U09UaH0SQ/LrpV7MuRP2wFwANvvnIs04Q6nyGIVaqt1qtIXpQ==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6j3LxpbrdluBTBtlnYd7k6ZHnWSHg1/5dGwJE7zCyHmWFastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=FastBusiness.Encryption.End">

  <!ENTITY CommandCheckValidWhenUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcB3D6eRVk5DW/oESDL5bhcSuKUJ4K4h0CNN08cqiJq/g3R7gWsN6rk1IoP+TTaldWVFIw/A1SWF1DsgqViAgM3TN8ybF7srJvXN/mDpHnl3F4OglDNa3+vTv1uCpdeN2yHZwGQYi9hdmKpZ08bXVEpN6GexilFgEYWieJ65JyCTE72cMiIMPtBIlLOM0rTxpM0vKMBQIvrmRXzrj11cPAlAhO8G47wauZa/i4sHgCNv1yOCwwhxArCC42BrmprG/tk877yhMq0UJkh+U8aAEMbQ=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$tXP3tPqmqEs3ulRKS/wYp7D1HfKA1TlP0dVOdd0GHXKz/797jJ6kKxzugzOiZPHWFastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$+b7JlU7O9lF5y8awHRuxFjI+eMaVBPuAPA0cgfZQfHLY0j2cQD9q43w8jBQN6oOKl16Rc/e1LaobaG6l6Y1bWqZZm2ejlN0a6KQQ4vyHERl1h4IKm8ygfO9PtSSmiT4HdSSRsUGgYbIOa9hPT+wcHOhVeEpLRa+Tf6Kpd/gUBKljxDelhUoPEMy1GI2VrJnptXxcxbg2qPcqmdSmg3WG2fq2giAe3GpdNofUd8lrvgA=FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$PCWPRgUI9wjOZvBuECuS4lb3XWeriIjl8hIbWnHMkxk=FastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22fBk86UO6HfKC/Tm68cQCeCptPDHo0klUsKbhoRlRtn3z/VAIsct/uensmxLOR/bGNAbU2kjjl7f0gxs9zX7DLRjzyOCGvX5wz/aZc6x3T34QQHfMF55PmD8Jn0jH6rLzkAvcM2n/xd7iHQitivuxmKLhgcpGApWN/u3KFD0HzG7FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6qJlPh/Z6qMJPVs32Wyj2NqJvnwXK8tt5lvNSNmrP/2SclHRvpu75k1wfR68XnEG8WqNG5J5UD0bxpNWMdQN9/sjwqIOiS8td9Tn1pCANtN7vKmXzE4EDGQNmxda3j8XIOWJVJUWZZ19j/P9EL+2E4Nyy5m2gDtkfOkx00QMzZgoFastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6qJlPh/Z6qMJPVs32Wyj2Nof8V66wPZa5gyvJQtoAYXcwri51UtcD2c00iBgmBrxkw==FastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrSalaryAdvance;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m05$000000" code="a.stt_rec" order="ngay_ct, so_ct" id="L05" type="Voucher" uniKey="true" replication="1" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tạm ứng" e="Item"></title>
  <partition table="c05$000000" prime="m05$" inquiry="i05$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" information="ma_bp$hrbp.ten_bp%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Eknp/YF5HQtSaJtHVmWlfDJQFowS714MKMeuedl/22Y/GjwAmy026tAEkA69ODm1Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu" e="Number"></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="d05" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="242" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrSalaryAdvanceDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_tien" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" hidden="true" readOnly="true" clientDefault="1" defaultValue="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" hidden="true" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="302" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 100, 8, 100, 0"/>
      <item value="1110000001: [ma_bp].Label, [ma_bp], [ten_bp%l], [bp_ref]"/>
      <item value="11------11: [ngay_ct].Label, [ngay_ct], [stt_rec], [ma_nk]"/>
      <item value="11-----111: [so_ct].Label, [so_ct], [status], [ma_dvcs], [cookie]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d05]"/>

      &ListView;
      &PostView;

      <item value="---1-1--: [t_tien].Label, [t_tien]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        &ListCategory;
        &PostCategory;
        <category index="-1" columns="100, 100, 145, 100, 5, 100, 0, 0" anchor="1">
          <header v="" e=""/>
        </category>
      </categories>
    </view>

  </views>

  <commands>
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafU3QcWHD7DGTy9QbS15GoatBAFmj7z3DyGe9EATpN5yfIhxWGGdWtvEG53DwwB/EOKt3aaZww1qNKeeLBPibERw=</Encrypted>]]>
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

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4lu5GhEr7giApi2+Qp31OWZQ0yly4yvcOCbkO04ZUCfKPztzCsefTfl3rF3Nr2s+By9xOKtdypZOdDjISokXoXIH8JkwmlqAGPPVWsCqY+56yYLrvPyx6k1wQ1MSqXWk2vmc7Q5MOZ+5QgJpqisd99LsFMYoD7qVDtJ8wkcbdM4SOcHim9UQVF2jhNtux1V2VJSVSLR0FaWG27YkfwWsuZaNbN3Tciccl8I+YYIyBMWGRyXA10ZfXviUadBQF3tuKk18pHAUkcNAyAJqqTB53ww70n/OhXBrAYLNEydjeV/6S1nbKo2hjgZI/cQG6wYL5rgu3NI0n1ZUMO/6bCqc6CL7OMFtrsCh7QbrZrMf9fZWnkroE/XYcnWp7PIMDlvHeyZwUEvijZ6poBraUzYmthFMco5FhnDnevDzYP0MBumYONpIfnqMYdH+/+LHggVdx4EahSll3N10wxtqz7AsGpAnVMkJ/BeXil/Q7eTCbUKo+TjS31GB29y/jXXRBbzucJUUSB/ODuqgyHOQE4yXMNCQbzsHbIDHq2wb5EpUFJR3qfb8Ulr8yMjPJrolbGSJ8f23NEZbztgUF5n47j1GArAbvmzi0te8cmJFNIW3zr6mDRSfN5MC3FK5bR+gSI8iaMoRBmPob8EBUiM7oLyQZNZqobKrXJehKrRcgHXNS5GSxZGJKMM+VCQbSYfoguGtdbqOr6t5gOejDcXOErFBnV8LFMjT8nGeI8GYk4Ej6j6w9G7t2j6y7AzvLpSKpxYpPDfLDqRIh0UmdHo6f1NZxxnoD5fBWrQF1YirK+WrrzlFfK2Z/9+gp1szmLK+CIKnUjRV5VqgiYAtZIYlKT3stXUXOMCr4MXtpA8e6p1+FxE</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwT1071WJLZREE3yflUsuPKZPE4WrmYuBFoobfGab6Fv/0a4Kih9h7pKs5qLFIE57oU0iWyXJkNUa0LNhv3009cArLxSwGCvDxTZKfTQh60RII1nHCl8P9wRu5rXSMiDxHD2U5g3f2FYQsSsJRDtKTZa8bE4ZxlpCk3fowliYeKzsA+h9izI13Cb/QV06+NnwsLN5p++H5TEkwHvHwWAIjrHeJSPBKbQ98nQNuQ7U+Uy44N4GO8WNxEZxb/g9t9nWLAlTk+W6NUuEdJUHmvXS3d5x9hty+8NTIkazhOJqb6ZZb5J8J8zSk7fUqkp6FZodcmgKR+/cmYGw+dnnHnR01mYGM5uwQz+2ndKqz1wdA2vSwSagYHrgbJgVjGInJTjps0v4JK6dP0wv4MqvdZwcY3XZyivYjhK0x4DMQrwUqLYXw+WPWEryz54ElJ+gbdueacBD65PdYoyqADnsupJUF3CpjJZjernjqmmHXo06HrxNsgAlMZ5KIT8++3sSQOOzQ==</Encrypted>]]>&CommandCheckValidWhenInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsnROGRWukxA1olcqtEo+1WCssM8pK1tf7K/gFlV8mrIH1UhzLl5ClTn77cd0Vy5tIOn/mY6RqHFTB6kmm4lzghM</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHCFZ5kSvCymldtnO7wGSJCQGEN8SCT+BhTN/7k79s5IWcMc1/9aXV+BrLXpiPwc0/+kw2j/H1uX+7EGiVO4dhc=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwT1071WJLZREE3yflUsuPKZPE4WrmYuBFoobfGab6Fv/0a4Kih9h7pKs5qLFIE57oU0iWyXJkNUa0LNhv3009cArLxSwGCvDxTZKfTQh60RII1nHCl8P9wRu5rXSMiDxHD2U5g3f2FYQsSsJRDtKTZa8bE4ZxlpCk3fowliYeKzsA+h9izI13Cb/QV06+NnwsLN5p++H5TEkwHvHwWAIjrHeJSPBKbQ98nQNuQ7U+Uy44N4GO8WNxEZxb/g9t9nWLAlTk+W6NUuEdJUHmvXS3d5x9hty+8NTIkazhOJqb6ZZb5J8J8zSk7fUqkp6FZodcmgKR+/cmYGw+dnnHnR01mYGM5uwQz+2ndKqz1wdA2vSwSagYHrgbJgVjGInJTjps0v4JK6dP0wv4MqvdZwcY3XZyivYjhK0x4DMQrwUqLYXw+WPWEryz54ElJ+gbdueacBD65PdYoyqADnsupJUF0y0Rv04l4HoOFDq1ThTQmWFDrCwCQFiuiHL+GrE83aOBIH7QoPlhvI/Ql378qFTT5EAxPfqCrTOolUrLYgyKAk</Encrypted>]]>&CommandCheckValidWhenUpdate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22cim5es08aIoY4zyaTyqS9yRboCgb5pms2g+4CAbn8UW</Encrypted>]]>&CommandCheckValidWhenInsert;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bSu5B1k9liPyiM8IP13Zu0GNWHmHItPSWrsNCAtYwmK</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsWfMUh3XieEIYWZcWwILaMyaAQ1j39p/8raGfai6OeVuWf8S4nW2M622ikFBIrFv+/f7aqgNpehoiDYfGlqRqgDYfYvpVnlNiemhlBaUDQrHUV700O/Ubb05oDRMVZZYNQZDP+p806ArXNJcF010/7ZNxhdRx4ZB6olfyMbuE/hac/U0CK5nt1B8G+6gjkT4SZKZHg4SdUK7+7CeiLF9eJ+iEWRLPMVfMRmKMDLjrEmWb9ThhU0x5iRr/MRSX883U/JwV9FntHqYPLD1RilmzY+jqbOEB+hHV2XkofwJflpXkaE+yjg4i9Hw0G0E//Elw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22covmg4h/YVsIeguhqhErWv96aOFvXVZayDsWlJveGQusS/3hskAS9+oMOwI9x5iwYrFJFXC17aLFGHb6bkDkkzKOCAAUnFNS0AWU6lT1APVk9vJ8/mT24dRUHXVFMTqVs26kk3RlaLttUCVT5qYwZq2Ndo75pkmTb2JsRqEAKWTRXj0fdQvy2KekhGx79HCkABiChBrAjz5Px48/LZ2HCiAUHltc+AUiCETnCf9H5Td</Encrypted>]]>
        &AfterUpdate;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0I0xLd9LnEgevIGjBxNQPrXv4TMHy+qx+lh1cfa0SHQLEt4PmEeEF4r5ISXOEw/m3g==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1Fn5i5cgK+OoKsI1/e8LHLmkz0Dd1Nu5cIHCLQ87ah2DdROGgC8MIz6a4rU0RudXgEdFragvmjnGWghDVT9YTCp85L7OB9+pIgCLlnVylfYhxUn84+nykm1V1GJGll/lT5jMFI6aInv8wQ/tczYgLU2BcSt83i4AWhGyw6aFVb/N27Ei9Nm9mdwbQ3s9ERAvFx6srFmr6Qf/1wWIPPFIwvBK</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfSa1IxpD6U1KaHDg5H0md/Fi3dDehPb2DB3jqtuiXCOm0ETcH+Rv2fDqY9yuf6kvigfzxIZShSvVQ3KGMG09wPefHBiVD6ivpHVJ9o43x2xYjC9pTAkrvprffxXQYX3lGL3ntAKvv+yJg4N/h9u2A3KIMHbcKvJZo1+FsQQZYt8kYhZdFpoVe6vdR2I0VytgFB2BUAIyZ9uo0vm3Hr1db4REiMmzZLRBuYM1se+Jq4qAio6AFeyuF6tyoEv7AuEALQSivxo7UZPpJuVstNXPxr8rBishvuGjkx8vMJCCOIBk=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezIBKihmXxBgBoTs+QFI0YCO9ZkJHN0axZpO2yuOuVGpH5s7e8LztIhpQUozzydxg6DtyDpS3ErnvC/ipY2vNCPF/n3zvf4DnTY48p9JJrCiM=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFXWYBKWe2G3b9BVsWJm2NfO2m1gsVittoFgG3ZJPy85RbwQaafXgfSke9YTSLxqGU=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Zwh3bGXTEXDW/lq385/T4/W6xDb1v/MXU2F3NolZSY65UZ2zHksmIsKKfcyNJoFQrsXJQyWroyPQujn9CkNzo74JQw3ZFR0fTEdbxWd2ozguH92KwdYqyzqRjfAu1QWisgKUHboiK+DktmdhMVsi4cE6nOIsonCoy8XEkyNqbA4OWuYzq+qLhj7D0C6soD+Wxgi/MkaLqVRNve5Qdk1RjKeCs0cKyUO+C6yEm5Nr3y3qeTUtv3eRH1fWsitK/L6yeU4qzZ54lBcnsUaiaexJMhU/OyDUae7OvOg+ZroOJmP</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f+qeju1WMpdHTyKloCcPObgLzHOCWHZN2tfoMPvbhXO/m6Hcs2oa6szZoFvEE2ASJCuBCPaNuO4zAAuJ4uoyBbq1419b2fpOF+PNRu9qhS0qvA4svIjMq6WMBbJEEULqzkirS9ttl9x1ovLjSi855rVH6PIgdf/cZ0paFs60JzY+ZNf8VhFouJa6u8oxV+B1dj28hLRmV8I/JhP5wplcsuEztDf7gnqTzY1svcngTaNF+RL4OsZx8VgmsAwraXhJxxFSj9eeb1xn1ru6+ABE5TrXAMnM8sCa/e1jDSohbKhViTxIIKNIItm/CCCkj26fg75OhYb9uqIrQUgzAnYrk5pcLGxKBK8zV/NwLvlSzXaBwkOeohONdPGdkCgwxH7ToPP9FpgBN0awED3iquOlYtqEYC3dC1/PP7tyDb539L5P1/xA8MJyFwF//oqHKiTSg==</Encrypted>]]>
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

    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4OhCFRfCy1GRSSaAdSJi+cHge8GidPcTUFYh+BLklXj/Zxvj0g2R28PNZronJwlbwBMIDUmAIbcm97sICIQDRHYIpobgdLnpsqbdqmotnciw==</Encrypted>]]>
      </text>
    </action>
    &XMLGetVoucherNumber;
    &ListTicket;
  </response>

</dir>