<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3FiJTNOcwHJYQdqubZPPfnz9Pkwa1dac5Wc+hd6wxB5WIu7oWZ+SIV7kaFfrjknQkXO3gnfdVPyJyUAYjQEZMB0=FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrTSDecrease;
  %Extender.Ignore;
]>

<dir table="hrccgiam" code="a.stt_rec" order="ngay_ct, so_ct" id="H06" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giảm công cụ, dụng cụ" e="Tool &#38; Supply Decrease"></title>
  <partition table="hrccgiam" prime="hrccgiam" inquiry="hriccgiam" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày giảm" e="Decrease Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu" e="Voucher No."></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="d06" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="307" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrTSDecreaseDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="status" hidden="true" readOnly="true" clientDefault="1" defaultValue="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 100, 8, 100, 0"/>
      <item value="11-------1: [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="11-------1: [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1100000111: [dien_giai].Label, [dien_giai], [status], [ma_dvcs], [cookie]"/>

      <item value="1: [d06]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;
      </categories>
    </view>

  </views>

  <commands>
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

    &XMLWhenInitExternalVoucherNumber;

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AslB4FmLPRM6e8pI+ijuN8WslRY/yBkqAcMOo61cx9BYESFAykZY+37RhJLbbYVIOoIOyRz7M9bx4F7KJPqw5wjH</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBPuYe3OuAowi0TuviMKjCTxdrtWrWn4xWNl6tSrrJt7m5cx+bwvdjI/cPrXZLU5Dw==</Encrypted>]]>
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
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dyu53a4n2EyscedLk9YfCw6N0y5hiQ0nqPpbjaAw/cNWH1+1Jio4YqQlnx+a1YODeGeqFzXuYEX1MBA67iU8ejYXKd8BAtTN7bOHdSgcWyI/6aNHDlszlirKtdjRVHBaNeHG561Yn9Hwxg8hEHW13PzUyDGE2lD/SNZtVRs2xcFrDfrtMFSXOMuGIGJYZuxpw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dyu53a4n2EyscedLk9YfCwEpwdRK0N81yHcDH/ileUlw0mbRlpybD9zrexQXJDElUp1DSaKVlX9eDpwf22mqjeNgGYbki1gOsko+b14UDAmu4KUGFYyyohBiZGq7sj68t8qfk1qEsUq+TbEHQcTVfqQ2UOns1GGUkUeTg3gR0DbNr7TWqmenWz5SoUGFTp1OEkf7B2e35yEhuy7o0I0wVg=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4W7+Lc585ygcKSWABV+z1diagbhbm327jG37VAlxQODQFuFwkOJyD3ZqXZIlGB8q+hS+asyIhu5Pa8XYFhweJWz5Jk+jg87fL8kwIajJM8d</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event ="Checking">
      <text>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1Fn5i5cgK+OoKsI1/e8LHLmkz0Dd1Nu5cIHCLQ87ah2DdROGgC8MIz6a4rU0RudXgEdFragvmjnGWghDVT9YTCp85L7OB9+pIgCLlnVylfYhxUn84+nykm1V1GJGll/lT5jMFI6aInv8wQ/tczYgLU2BcSt83i4AWhGyw6aFVb/N27Ei9Nm9mdwbQ3s9ERAvFx6srFmr6Qf/1wWIPPFIwvBK</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJhES0jT/2KnkfaSc50Zxd5ZZwJh+QxE9fQC5RWXH2V+bKaNBPz8kR26i+ncOs9Px/WgzVslywWXc5m99zyZZCvvasEhJm5ovBLyDCOPqKlzTR/EWz8ZHgViWBy9lH0QLKz9hpj998zWyJXjejyhg0SwPLsTe0pxJpIPzsEPQcyVEUz79lZlFhWNgpIYFQAssKkjsk8mkMLoBjNCzgFwnItg==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezJyWluZoBKCmBEOtVtDR7WfzQrLUVyY3CuGf2Vev43Ml1u7Uq3H2WrGe/NOfAYBTlYg8o8DrpdtK2VkCtx20n4fJ5dDCRL8mp8v4SqxJtm4RHnaYW2JATVsZ/RAqj0MOFzcGiCrtH/Jx73bsOlOJIbTpliszq1TloR5vwXx/O+zAs4lM4fAw89/YTHliEH+bp</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxpCQIczZQQCxY95rZRYLk3m4/xVmlOJY1Mec+nxocKm5uwrIkBmGWaUtsfxSzsGQl</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGU4p3R7xoOoAR53qqQYEVsCPkDAHfyCMFHJEneeyT/Ew==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgPI6G//d3xSgrfyqkXgpMAUI94BfGWqMAzATWVXhCogOkITnUl+wQ/s07h/M9Sf6Gw6UQa11OthByQyUkWYF+6</Encrypted>]]>
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
    &ListTicket;
  </response>

</dir>