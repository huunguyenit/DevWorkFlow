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
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucher.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcEuiiRqbHe3Pt1lLhOPPPMdo0TMsIjhPgz38hCJILvgc3xmXVdVsRthxKUVFQ6m6s0Ztai0P7q53jjG89jfp6a1LlJhblHu9TLMovpX3AyDwowDCBSlup9qFGsDCmLZwlVIyLynZi1nef4NlWcI+Oxey8qN4pPhhXR00yLM9LVXxAH049q0GmUTvkLZ+oL/bILRQbGYzQDTeBRozjLPbx6UWlcut6BSjVSG4YgxclvvtUkghb0/BGDpD8J8rWbSGbdoIsHwZDNe4ACI7SJ0KgdMJYg01lm6PaPq0XxthaeAGB91+jEMnYMLll7RLzn4z/Q==FastBusiness.Encryption.End">

  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcJ602xaGs0y8iDHx2mSdsuMZdQ6DCUTpksJa1zz8b2jVVFYSlw0vpbS1CvPfU4gMYehnDRvCwd1vqoJTU6hVBStkgJcn5wyU1zrjN5BgVNoFKA4umpYTae8U3qDIsZ4yi12ArfdABnmR/HEtXh82JOMJZvDqLIdzpWUB8rTuNUcDMOL+fBJRJKsHWQx49mtz+aUYoaaWzjFudFAZqBWl4sVDo84VL19NXfJk/7JaUd6se8nqvwIkNs78bVBv5tKyc225yB4+g/qnxmTD2prWC6VeSzCysnN+hMUdvvFf/5P0T1aJxlzhix8TRk6NxuSMtxPzpMpFuycBn6G/bo9kwLgu4crpqKwyc8vlVBsUuorTFastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCwZ4zYsrCKpqC0CtlesfeIfLiDewCyCQ2x5OftU8hRuUwniqC3RmO30riXsEqYCR6gZFQfT+UjhoxHecTixkcFA==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$H6MZbTfLMB15uI4x+okVTMIJ4uM5uH0Diki/niJdXfLxwSntsneVgW3wH30QNRqpCBOLbujaBKm+dVrZt5Srd5r4y0pCg/ndfqjKzY7HRi+HPN6RjbG0nYP1uRn+GZRgFastBusiness.Encryption.End">
  <!ENTITY Delete "FastBusiness.Encryption.Begin$7vCFVZDwgri3tr3anPQUZmDqBrASrmMvslfSsEj0Id0r006K3xlniVXrnO3RRQbhyyKusd4O1wwbbI+PJJGdAQ==FastBusiness.Encryption.End">
  <!ENTITY CheckOverflow "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22dZx+2Sip+uX7ZPthSRW37m2Vd5JeB3PrTmapfhim28rFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$T5EkQBpcXNCTKupcY0FFkYkm1/1GG3b3gl5mxjHGJkMGTmkNNlxGQ0sh10CF3V0XYmKWOHwichaIO81BqKFDHKYErBpVFSh0tjGQ8728JdSYP+kAIwGnh5EEGEOkrSOF2/TxWySqGMAQMAJ5HhirgYflUbPM8sWHMNiy9ULhTXAYLFI1ZY7Zdp/glzib1NnEFLABHudheh8iBGpYzLlD1xri2ADk2MvCHfy9TVjE14qi7ZmU9kxGF8FBxzKpJhwInFhB/e6ObWoaa44FSgmhuQ==FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$x54+tLgWl4lrpY80Qb5NhO09Xp207a2+B0ayP2BpS9dvAZeGEjiAxaZ+PlAAHI8LFastBusiness.Encryption.End&quot;FastBusiness.Encryption.Begin$mMQcSKIn86tOHzSeTQiK0d8MleXjUSAnM1K8hV6vwZg=FastBusiness.Encryption.End&quot;&gt;FastBusiness.Encryption.Begin$wYdW/Trq/wlef83uPGpQ6Xw65XCkd8WaqfkzGb9XSIY=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$L/pw6lFTyul8Pp8lAslqPL9fPjFWeLP/fszod/qQ8Sc=FastBusiness.Encryption.End&gt;FastBusiness.Encryption.Begin$2pcLHIFTO5GJvWdoB2BSXwwhbUTpC+20bLSR3J5FecO4PXjp62tQBguA9D/InlUupEmCTTeoZUdCwS25E87OozS+mkanwjN1CrSuit6TPKBuPiAVnbIilfxeFucg0y78MPEeE+ffqXYR5eTHgNwjBT9LKtZhZa1QkCV6rcp4peRsrgRGzt9y4yh7i6r2DgEWFastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$x54+tLgWl4lrpY80Qb5NhO09Xp207a2+B0ayP2BpS9dvAZeGEjiAxaZ+PlAAHI8LFastBusiness.Encryption.End&quot;FastBusiness.Encryption.Begin$mMQcSKIn86tOHzSeTQiK0d8MleXjUSAnM1K8hV6vwZg=FastBusiness.Encryption.End&quot;&gt;FastBusiness.Encryption.Begin$wYdW/Trq/wlef83uPGpQ6Xw65XCkd8WaqfkzGb9XSIY=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$L/pw6lFTyul8Pp8lAslqPL9fPjFWeLP/fszod/qQ8Sc=FastBusiness.Encryption.End&gt;FastBusiness.Encryption.Begin$ikUPZWYFTC3+HH6DAZXlD7EaMTCkohrJMogCwTN5hAOvIYJurBfaqxHEEadejyZ54kXwmDomuX3xGLIOk7oAFXVVpBn8pTCsn+AIUmdzwFcJXysKubasg8wNxxWaP+WPTPUT5Jv50q7lMpooq89psP2Izo7Ub4eibYNFKUBpCOhLCfCWG1DeuHgaq8lWMW5V6ScWXF+U/lg5aQvOf9GO/C2IA4nQTnxge8/MkGd3kImVVY4UjVK9awUgOo+vZK+qqr/kfkdK3rxd6ZIW4x3g4leqwnPPs8LYMIWeGyxaoVdVZFCloda8/Q0QA14ByDISAnpbD5sS585I2MYzqM2gc1JomU1In+Ow2QR34fGgoT5nBVtI6RWemBke3e5wtPlYDIMnp760NjwuqSQPtfhRcKmCN5Sd+paydmqGPbB8piHTeSGXrPXT+yu71GYd6ewG1fjJz7ZHq7ZrS0ggoeCkpiEi7Lhh9HmZ2bLcOc8Jpi4CLYhSwCxCIFZqoCe1X5iNE7uxYDxqSVn08E1qMEOOVQfOe7Gytc58l2Vmww+kDFo=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8lCaiqKRBD5C3p+h65lvYj9A97w7P/kuFGMslKTIjgxZvkkgajor0NGWhT8atDuUU2GkcRH7nFW5npRxtvZN9LoVJf1/pib3vCaJ2+Mzqn7jNV10iRlW1Oy0ufpEbgmkr0FpqbiNaAZ5wpz/5u4T8vqZ7qvIIg1rowFQPaKstNy2qhWD7aXNdqriu/lkS0ZVevQ3hU3JZRl7PYGztgZt5yc=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8vcP1fEwnIsghBJP+DeoIvhcQMi2N8Qnprdl2GqQ9KBG9Sux59Gm5zV6F11cuZ9Nej6xKQ8LR3cToXzKkfy8YOQN7aCeTte4x0NVIpnsq03J3svhnqPlLF7WwLclDLgAZQ==FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.RDTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m43$000000" code="stt_rec" order="ngay_ct, so_ct" id="PT0" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phân bổ" e="Allocation"></title>
  <partition table="c43$000000" prime="m43$" inquiry="i43$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Ngày lập" e="Create Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="d43" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="297" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="RDDetail" row="1">
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

      <item value="1: [d43]" />
      <item value="--111: [cookie], [ma_dvcs], [status]"/>

      &ListView;
      &PostView;

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

    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNJkeiPDWpL08+ws68t8jq4j5m/tiYeG1b69utAr8TD2lncvAcXwp5+4b6+9RMFaAK8HjkiQtQzvUvVWDe1F+3s=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmI5h5y8/E50cIImhg81d89CCbMMAR3IWMw/im/SAa4Pcw3ycXR6FwOeUucxJvcyFXpfEOapoGHwd/gewuP72JZ2v4Bn4YZZHkblSfweyuq3KkLX6f4+p5Firr8F4Yx08s=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGaffJM9cSkJ96zg9suarQKjR/YF/DBpKASPKRU0MGROeQC3e9oO55KA3evq0DIorKsD5yR2rXGiBcV3LjBhzwElBrqSov/CZWs2B1noac+3Lbb</Encrypted>]]>
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
        &CheckOverflow;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPInBVr/p5S5iGbyCRl5gWbODqccshl/CjoJ226uOxZjGYwzxyLz2pVqu72jOO95ysWwGnKKoUgzKoY8svE4kHl3TKT+PkMNPIu4klNalBjdeTIWsOMuJf19azd4BUPnpV0Ca/SdlWiRIcnjy/oTmxPl27QgEqHNgg3+jzB2sXefP+7RsRBjuqZvU69zjpEbXQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLU7MESFKIQB3tb4hJQYqs194fSmtPB2Nb87lvNs9NeplDsJtoiLiyPw8uu9DjVzelz+D+TGR7mUmbovGeuUB6e7AzX81HQUsNI8CguYDNdnTSsYB7qqslPhZQUvdGfP7m8yxdgVe1HN0wuOh/dq1dgH+ctgKW/akMaw3CT8VDVr</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ01iW7Ze9m5ENFFi7tbDtMgIfMsJrM9Gv1cJykfTRZXrTVN8+WFr3OrmAgOtzS6CIac5Vnqf1DvwSt8mlaztqDvKQ2zjC9GHYdTSf61YBXJuTzW3kg4JiSMFdGk45YoAb0w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckOverflow;
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        &Delete;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekux0VB3NFILNBPrXLAHeuWrPia98I1FD/D7BRgSDCaWEiUgIYRAXFWpvEHWeL7/U0fJhW36X96iTPzYXXMgNCz4Qk8ENT/mYoqoOYNxFOApEHC+ut+Fdcx5OOebn47wn6s5QoL5AE3yNva0ExYgt7FdmpH0MNvQc581qjqgPhGsx2DlsgM9JzSzZMn7l7mYod5UqAdngukzArTRnhv20b93w=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dZx+2Sip+uX7ZPthSRW37kg/6vxxnE44gEXC3a4L6DQNYotws2OFsvOCMy3WXJJhOv+oaQokezAUxvtZcpUUtAxrrxMMlb5JAt3S4e7hev3KarbojR3VW6CNK+yUIm1AuvY9rj66mHpZZFHxCJ43T9Zn7tNP5pFpdVjjx1isfrbBxynpGIsqeiLEgIX0/KnsgT+gxrRoaDxIhzbW4q0YvQr2NQ2rL4z3NMJlIBRh3tce3kSma1qmhSE4DyCV8qh1KY1zUk3zvlnXlkVCIOUJEa0uFYFquXEzyH8QkalBbBT</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgThMW9La5LeEoZ/dpNGPeDCfYvtGmVbi+4belQqkRmHrhA==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        &Delete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu19DwpcURlr/lW1+Q5cJ8iXBx/SW/t20TQ/4lr5856tz55fFLM0jc/GlQm3guFCBkUPf6YeZU0sUixRkHy/t4OPox9RBHfVuLRC2iSYpGd9ub9J4EEztOqJctFtkGgRMfEdSOM/k3Mnw3e1VCj8cpJs=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4YGBj5wBOv3c7w4VaeW4RWB/WABtvZ/uzBl1JlbChEinVHqpj5pnkq1TDqK73UbAAkNujkSagV4imXS2AA7lcXeZOQwBNe2RrKM++BC20dGi+gsoCCdvHIT+EihjSN5fOnohLzU+VWmGunGxIyn32AkFa7RghXSbXhuck7I4f1BHqbif1Hf0ksPlo6W1eokQq0sRHBn/F+PX4EVtCvx5tMdn4zR5xHc0HNEqQ+iSEL0qKRQAuzU2unHmDS7Rk0ZwHr0r7mEQQu4vPs/fpyF44Hn8E2NHmIBqT6C4JcmYLfc6rTbCDKne3L6jvtIZ12wkxbJNEPKuYtbnyw/dEEFYHel6OcEOvXI4oxrlL+Ve5UJqnmBau8gu7za1QrL4Orv0kiBcRXPxtr4kdxbx9CqfFciLeBRzYmY73Dzk+41gdRmApPuUBpcfexBOroHEvzrZPj6BpelUq0mCC0ijxTcPm7ORkD8rb3vYZCT+zwOzvjahV0pyHcMkPWAPAC8U2c29XpE+Elw+4Brjw2olVnLP4bJCFs90H9DoxhCbH2SKwFryqzDvQb+bYVDR4f0Yd9xYduMXehLhUjlKM1jDmQLUEPn1THygtmZ3fYpjAvFq8ScKBavO8Vf3zCnA8g8FLGbITwy4QZ/xQ7gEru2tcX58EgOjs9zl1+koulfoJxX/jEwQ6DE/W2DEMDKN0BM0IZGN3x2rgUA55kCT5QK70rSOZB7FXN8eZ4mBl4tX7CKTfaDuvcdmWuV2I7hAdW+fdbAcrezy3PcK5J+YdgJkEcwLHzGdpU7OzRZJiNjeBdgtZuIPd/8k4YoIKW6vCN7MybFSoYEJvZRbOVLuBU7eSkhEe7C0M3+7BGO5FOhW6+Wyj7QCraXQnEqe+EUoSKsail9vi7YZWvdwkD0cLFDhVxkrw049mw9KVWnhFoAT1hU9GkZkXG/J8HjR/NwtDLymh6+EvvYnmVPhl81A74Vkb6bLafx5u5ZY0hEw6QY27Jy3dw5/alP/oKrJNW8+DgRI7t1oWiQu7aMiFvz8NsOWjP4W6XLdMn8JTvjnrtjvFBiJQYP8ft28v/AqIWrKSEfg12VsKMjDkvZKF7ud8pPvp5LZeZY=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwZ/dpU+llJa/W+LMyYDVYlBvBroHTRZduHSFsrI7bRG3TUZ+rXGn5Xxc5wCq9ylJt1RBeRIRYVKANt2e2RRAYnadhWlwRxuijgOVAtSMegapMkvWxhzCvCer5LMpVZ3I+E7nwouWqCosenwJPJaepamRARdBnSPYiKg4JqzPChpO/05Ni0KTSWR2IF/PxlX1ku332gp/ix3ldT6skIeUFN+90a25+dDJRSSuAQXvgzYQ+SoXrgKUEJIAFfDRaaawYF/K8jJ/ktNEOt4oMAmOqNSC6kc2bpMF+UHruWwOENO7QY/GAxpVsK5q2mQyiY0AOfiaLJWyw1EsxQspjohlWjB2RPuyTiL99W5fg/cj8FBpb+g+fGeMvA8Z4p4Jsv6kcrZcaoqw0lTivUwbir0o3L5fYfQr5O9/e7cvc3nOeU8g==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfSa1IxpD6U1KaHDg5H0md/Fi3dDehPb2DB3jqtuiXCOkxLO8d1KLHX0o3anxZTGRW/beZOHaHKXWSVEfjt1+nEZMW4r4FoQnOOkd++DpAcMZib1KiN50+PkWd3W7fvLuDGvC63kfud/tSLmHOw0hEKBoBqxYlEvSUeC61ZRpikpp4GbwQU/3JRp7v9XXzHCyo0VUzJNC49RItQSjyeVAJh+vUImFfuts9OpdAtYNONV4AVuH6YsuJFklwZmEB+HkOCksKGhfygGl+uUdNuEeS+QpZmFh/6dITPTYFW0LuvXbqlHsddKz6S4i7jXedpEcq</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezrrkXReLf677iXCbXFBhXhgnsYxilAlAiKI0yB9dWVOT9zLPa1ng6sM1Q8rBoG2m9AivpENQzoFQk/YuI8g4klWj70F/07hD+Fjgifnzt/nV5IGuAYVEWFwTcQCisLimY4+FiHMpyu6/hKRlKsKUn6tpjSHgQPZHRV+vlZySIlUXvCSjfkW84cTEhRKVX70aTTfA6TDj4C0Ix+18x+0mbbQ==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8K1RVCY4SdjgcsgWvnNvRWMjDE7hA/8ie5FicSB1OPX2b112W1p9/uoSLogg7Dmj4G6fy++nk1VdVD1CTB2v8n+5NmtsWhkcdoQqpJnbRiMOLgCj9E6wUWLn6K9smZJVlSqbNwVsWExW5W5OLwd8y9tjncHTEffWDa0kBU30k8TWo=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUGZBj3XcOzatM5XGYYefE7p8mZFVF1aD3BUmrhNCLeLPhTZrtfI1k7aBX3YF107gmGlv34r+oSi6LjNN4n8opiyPw/xNYu6CqgTjnv2fu7KQ=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Q2El7xl2nclV8dy1aEwdR1are2UfzpZOiL0JpXF4tb7xou418D2RnV77bhjyNG0EOx1cdRLwIc4TKydiYJBP7LTOepenn3QrOTv10AQMGu6QJaTLpyvJSRpAw0iAUln+XRfIzyu2jfoRwnGLot4984=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqsRfkgz22MclWUfLV2V8ct63xXygjA42DUmPoOxNTD4MJrCEvohECFsjaPtVaD2VK2PFpsUZ6VRhJtPPuwVYNxVR9AdDJkE9CFiuGG44gPEHBSSC2C5mNsRgilsQ7Yq0Ze7k6LTd+AgpbpbCGD62rNfrxyHsctXkaubheZAP2zUq3498F+xhz9qwsLZy5Z75F1r/HnLKXXyJNOBOj6Fo7ywMDRZuuXRiGcldOC9wam2mv+7SSBHy088y9q6WakScjhnhZQATnnj0sCVcBdoVGTng9ot16trYN63AFZzc3dc+IZTmJrYF1/C83htJQu63DOm0k9TqgEAq+BTwbKdcj1J+mkci0Lqua+rAuaChLRGltRytqw3KEEwdi9CRRV5ixS/etmUzKYXUBNHQJqeVYjq857+jBeNtZmkkHfSyZ00cqxLk7vT5bBonKQtDKCLG9tE4aX8S9cGy+6AAv71QC73gafs2P1D9l/qeVi3wilXpJ7OY67EVOtT0ssuOaBSRKlyonChZMno9Stf3NF+pnFHqlmjezoWfT3smos6jFqCNvf9tKsaDm/OKz2cnJ2tqGdWTF/2hfKPDlUj/ajqKXQlfYgFxhWh1jw2Rwm81h5XckVxT0y1kT5OwjXbuembrvyHtP4M6wHli4n6uCKED7/A2FEGFZypK3SMRJTT9lx+alU0RH6f3BmEi3HEHNPIgMiJyNxke4b9imCHnY/guhmNkXx59p/F4hjjMmocf9Wxn</Encrypted>]]>
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