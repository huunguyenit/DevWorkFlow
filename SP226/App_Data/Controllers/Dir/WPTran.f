<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
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
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCRIuD3mJlxnac4bdRDxaQFR4dpJaEEmPEQpM2SaHXJiWeyGeH+zWvvrLMkfG0urOWdIkhHWpCGchbKKzUe4ynUA==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4fGOw6GAM1zjgpTdg95sXBdfSXonmseuBbfyB3d1Nm89KdPu79CEs/0TqXlfjHpK4c5zEjwHIRZ6JPrqHcIIH+grO7J9xgrrVPtbVs0uOhKZdZ1NYUgYo77CMqupkp3PPHlw+9lTWJvq+oTnrOILc+YMiM5GKAQmn6kM33PDKoYpBsRYnz9rPVpicx1xJvC7vg==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaU5x4xx7q097+8cyBU8LoHQGHqayZE4vfGrOmyE2xIry8chPVq/7eFufEgN/7PNlKFAk/enlQnvaH15HPZ0guyeFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUTWTmxkl/+1EmfZzjOc0vxY4eWMIPCuhlGBOv0fNlGxSOgw6SZ9nqmKi/+H5VpnuYA==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.WPTran;
  %Extender.Ignore;
]>

<dir table="m54$000000" code="stt_rec" order="ngay_ct, so_ct" id="PC9" type="Voucher" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tất toán" e="Write-off"></title>
  <partition table="c54$000000" prime="m54$" inquiry="i54$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" defaultValue="''" disabled="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="d54" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="297" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="status" hidden="true" defaultValue="1" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="357" anchor="3" split="4">
      <item value="100, 100, 345, 8, 100, 100, 0"/>
      <item value="111-111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110-111: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
      <item value="----11: [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [d54]" />

      &ListView;
      &PostView;

      <item value="--111: [cookie], [ma_dvcs], [status]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        &ListCategory;
        &PostCategory;
        <category index="-1" columns="445, 8, 100, 100, 100" anchor="3">
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
        &CommandExternalFieldDeclare;
        <![CDATA[<Encrypted>&fX4o0nK+AW8MIUygIYpQ79kiLkPS4vffV1QGeJ+bGkvp+UkK3M7IPlL2V79VZ/b2XLQQrLvKV5roHRn6PXu9cTaXeOPqfPdEhVqFn9fl5CcAMlXT6MyT2YJEt0bxJ4RqTDGKrxdKQ0JicUksaHwGudYV3jIU/DzCgJ10Yf1l1PVWC5aZRmpCadoL0wVDK6HH</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+NYvUq8EpiS60n3m+WY4gtensAHIGflCyW8JWxZzYvZVs6qSuFucHhf/k7sRuBNjo/DuvZiMO13/5Rmdu2n+HBQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNnmWLk6emCVjylBm2Sb08abAEKMKja7F8zgBvMIHGpxcQ/Rn4Xe9+1dWRXMnQAeCuIvcmYYifBS+BFAYMAU+ws=</Encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34IHlwt24I/MArn2WpObnAPd9LPwnQpbpIQWpziQ+9oUQn/iT2z99ZthpfsW0Ckaw3Ld3/g5QSwFBVSY2uJZltPsg7vrMi8sFK86zj0YZvkaKg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        &Delete;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku8P/IdNF8NHki/JvTdTephraxPQGRYqQacLRZ/tPkDaAoUvWJERQgZST77qsWxDr/9cdA3OCHhnFs20Vgmp6Pe3ISE9J2N8VwupZsAtFHU8UQNya+JNq5lR6qwJIslbXz2YUqV3LJgkKuNOJRUI8y/1+0gwzlRq8oPDoZkubK+Tz0wsMlbp4e5XrRAGvfjP2/MmQvM7N4WDFHnsJgzGr2Lw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WP0yrOZhf0uGYUe+olFUK4FF0gO6yk9E5KUGQl6SCf9kZRUn1Rxc3C1KLPI4WqZR2iXH/gVCxT4odF0xvNIigyqy32gpA8W5EMKr8oKZzjsLdLJ3zu5yiGyrXgYrYdqu5xxT4icijxlKit+ySJujaKM2u2EzVkU5kAdA1mpBpggOBppfJKOFf5HT1lkRhEUldHBi2FUHDPB2XmM0tpTSOEPdR7ArSOBZ9/fhKg5ruf7</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgThMW9La5LeEoZ/dpNGPeDCf8peIS3sh5n4jykJlsQm5/BNMlE06VNnJIA5Eyw3zcWo=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &Delete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLDPEIUUhfUddMdXJtTIlRgebmKmbXe5RH75e6xqgvYFLYfZyc+P9QzKbimgGrbWbexO7SecuTTnCHvoNdFCWyGXKiXrQ7yH1+iaWIaDn450c=</Encrypted>]]>
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
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqmOY3hzBV/7Gr/mSJVerJQ/3Ft9mnU5Ktm/5VnfOppIAWKKqaFXKHbM355LXs+WyJPKWpnkdpH9sVakU+9j2X2MwJwTRoP1RhdyshpQHhxj5b8NUyJHFM/uFAWrB8H+LegWh2hAnHhja9Ym+meOvhW0udCRAItqY4vlUQFEqisk0ZFhkmlEkhhQMM07VL5+5ZBciSZ9i/5ldMogZHTl7A4pujLWF4h3ErobelJ/80CBRjVJ894R1o6BUom4VKbc+F1CragwhDO0AO70o+yt8zD4</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJL/9zCxWoeFHywb67Y3vhh9Ehuej+reXVrOhSS17X2QasgSJ7x21r0WhTQk9Vay5u69Mu/l+8Yd0r+YRhr0p9tH16YTtVWiuhx68dB44p2jHz7WzJhq3wPMqXOjgMl6kSwyWtURJKzFvRnbICpaPPERJC8F+p3ErMMOW9sxR85iOZ56wdT9ySKW+BnWughtBU12yU3ginLk3I6nuCSyswV371cKKCr4KJwo2k1xeagIw=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezBvQ0vhO5Q8MvLj0TOY78O2UzzKR8kMR5JhI2YQHLahPRvl/EX+OJmzgqFQEuFEo9JP485PUH8f8j7RmjeDP5vUfjL4wlBAfE47FOpeQchU8=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RUSvFgS+eLk9naQvI5EkB2W2luYghHYJWmH1e5AMY1TESMN8sMzATKbZjrk8dGpF+hL3oBu2eAs9IJzQurwsv2mAQCuthg/fCnyhSAf+OBdl+7YOjysquWhop5x9q7gC27irNnKVZKBOFx2UEU+KCsz9Ef1nOLX56STanmES/8IumgtevytFYitPnUDuVrwCfObm9W3UPLXi5lhFDSLY9VRERARJTvKfpg8n/+jQSUkjyHHbQI1stXr4/KAlvD+57Nw1PSWq34JDpezojqYl0niPei1ii7rBBw7XIFrQHYB6w==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUGZBj3XcOzatM5XGYYefE7p8mZFVF1aD3BUmrhNCLeLPhTZrtfI1k7aBX3YF107gmLrNTq9VAy5ruBxoBuzAXyIoZGzWz5yMH5Nrb0T/u09t3wqFit+QkoeWxNfjxA1rAKggUrLf4UxDMBKesucnx+ZIZQv+3IIEUmJoFolUbtFs1h1rf6uGGKsaZ1FcpieLUZsnXKps7bbybUHCcjpQDxQ==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VwbtiVabi5d5ij5Cp8+oJ3tswuPgm66/OXs2sZp5Rs00tQImWtAg5Si78U4Vx3WNXToWCsJs3cqeZkQXvRAeYqsDmYlas7g0TgKwISMYluYL/ryL3Hqnx4mPf4j4GcwCKPDbI0iLeDacaVovUL22Fl9NJZ0zLdwg22WQJASFy8O/sICj2I9M277s/xomrUgxywJjtKGNRSOvsHF0HGwnBkab3ti/Wu2bpBQqRcuAw3bVsYY4CIvbziYayYXj3iBT4EVBdMtVvpmObDusHvpDtL1iC29hdN2Hae/LRDtWW/9Hcl+6Y73LM5c6qmjoYWUcF26clEUpD16JBfr8GH89onV2ogbhTzJDbwACDs3aXNMqrssoHoqXTkPpluaAWCo5OEXToCuXrhOLjyx7ly7hGhK8hxUwm60eaL6cXBNYRUcNnl0rYGp4baYFG284uy3Ta92uVd7Eb2e48XYgMSBF0XG1YnEqB5ResC1nDDw1OarDCEpKh1l6XiGvC5hKfR6dSuFV0Fwvyf01ellBTysf2zPeVu89n79+D1pYzlugWuPmFWCSMJvuzB0TwbN+NiEj+YUfhvRTAy9A3C99EV4xOtrJeEut5gdn1QX/MPm/UV02LNgpVtvIVRRbc4i1fVjHihK7USvK5wr1fZz/fI8rcwIhaKG2zMV2s9OM3EKAnw6mlWbcs5WV81MtvTuUHuB2gk0OOR/3O6swoimcAyu1cfn6msBrJGQova1i805v1WzxsKc18gwpLM9WVbg9xx1bwrJ2fM2DgCcDeKeIEPk2is=</Encrypted>]]>
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

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdSRYWRj/XH/UM8voPwGljQ04mkzWew1IsfPZUZcI23/98dO/dTxkjKD/oT3p8bOm7A==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>
</dir>