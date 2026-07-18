<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">

  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\InternalCheckVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">

  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY CommandInitFieldDeclare SYSTEM "..\Include\Command\InitFieldDeclare.txt">
  <!ENTITY CommandInitFieldSelect SYSTEM "..\Include\Command\InitFieldSelect.txt">
  <!ENTITY CommandInitFieldSet SYSTEM "..\Include\Command\InitVoucherFieldAssign.txt">
  <!ENTITY CommandInitFieldQuery SYSTEM "..\Include\Command\InitVoucherFieldQuery.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuxaGePhHuYi4ceXBt4E0DeRxBp/mdueR1zmylyTJbvPg+mpMk7mJVBreRVuQj3vlbJui7tibXZuXBPvzYbELgdX/e5oMMMD+P1q3ZUSIdo5D6XNWVOW7g3L8KaPxFbs8fNhWMK0/M2KEq4cBULWdIKSxGJn1x0xzld9G9PAJ6812m/9L5wgFDXUmf7qz1L/VDA==FastBusiness.Encryption.End">

  <!ENTITY Declare "FastBusiness.Encryption.Begin$I1OGFRTS88AUBz076Ap8WNmKaGjvXLhTyZju4LGcyB7f1PbT2DnvS5HhelFKlbWYxPAnMSaYvoxN1ofYqltYnM/Af3jKPZVHYcqDsoF4EF5Qr1yHgsakMidWD+CTI5IEFastBusiness.Encryption.End">
  <!ENTITY Set "FastBusiness.Encryption.Begin$GwGq4yEnTVuiQy5cJGOcG+2aA/DQGh21WV9VzjvLnmZO2rQ//MZncULecGy3b6KYZNx8x8k1iEi8QpMEXydNwQ==FastBusiness.Encryption.End">
  <!ENTITY Select "FastBusiness.Encryption.Begin$3H7kPWBUT0Qgbr/0jUL753GAeoMj3gIlG1PDC09oCybWje71ezl0pawaVYcu6qGHQi3js0OO7QGEEHscVAYxu9u+uW/53VzsnGm6UH2qutZXe067+Y05g8jiZkGVJPZmZTP5dprM6aZw7DD9TCKErczkgnku8yGTyvaFVfLPgW0ywdxZvscLLYf5Q0FceNwGgngat+CGfRTNpYk7GbUPew==FastBusiness.Encryption.End">
  <!ENTITY Message "FastBusiness.Encryption.Begin$DpaX+MaR03TgOdRFeOYaWY5YNDLr5MuxUY3Toac54v6wV3FHn/52i/TNae7L+VBypCgYJ6P/0bXBmFVfrHayP2V6a8jqnQ2CrwVa4bCNLf3mMxd0UV0lu7pqw8V/DbyVP0sXRihD4FNW4z8kYgSYMQXDl+YcsFbMokWtTjeARPg=FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.HDTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="phhd" code="stt_rec" order="ngay_ct, so_ct" id="HDX" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cập nhật mất, cháy, hỏng hóa đơn" e="Voucher"></title>
  <partition table="phhd" prime="phhd" inquiry="ihd" field="ngay_ct" expression="''" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" inactivate="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ten_tc%l" external="true" defaultValue="''">
      <header v="Tổ chức, cá nhân" e="Organization"></header>
    </field>
    <field name="ma_so_thue" dataFormatString="@upperCaseFormat" external="true" defaultValue="''">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="dia_chi" external="true" defaultValue="''">
      <header v="Địa chỉ" e="Address"></header>
    </field>

    <field name="ly_do">
      <header v="Lý do" e="Reason"></header>
    </field>
    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Liên, 2 - Hóa đơn trắng" e="1 - Copy, 2 - Blank Invoice"></footer>
      <items style="Mask"/>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="noi_lap" allowNulls="false">
      <header v="Nơi lập" e="Place"></header>
    </field>
    <field name="ngay_ph" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày phát hiện" e="Date"></header>
    </field>
    <field name="gio" dataFormatString="HH:ss" width="100" align="right" allowNulls="false">
      <header v="Giờ" e="Time"></header>
    </field>

    <field name="cthd" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="235" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="HDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="status" hidden="true" readOnly="true" clientDefault="1" defaultValue="1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="295" anchor="6" split="6">
      <item value="100, 30, 70, 100, 137, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="110100-10-11: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110000-10-11: [ten_tc%l].Label, [ten_tc%l], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="110----10-11: [ma_so_thue].Label, [ma_so_thue], [noi_lap].Label, [noi_lap], [status]"/>

      <item value="110000-10-1: [dia_chi].Label, [dia_chi], [gio].Label, [gio]"/>
      <item value="110000-10-1: [ly_do].Label, [ly_do], [ngay_ph].Label, [ngay_ph]"/>
      <item value="111000----1: [loai].Label, [loai], [loai].Desscription, [cookie]"/>

      <item value="1: [cthd]"/>

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
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iRmC3QV2UU6lJoAOBfaoMmC9DYeASwLrm0aYN8LfXTXbXjYe2+VM0UREx0E3SiCbt6D6ANS1bmHD+ogz7mv1BaA==</Encrypted>]]>&ListShowingMessage;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkW5VaPRT1bQo5kzjHaDwgy96RtLvKQKn8wJsrKK6s43J4MDp8m+wBHKsfykjbLEfI=</Encrypted>]]>&Declare;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ1XZUR6wpHnRG8RVwRwigz9yIdd0g1725iEkThkckHjW95FfccKRcRq/GFQYXDM+g==</Encrypted>]]>&Set;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHGqWdZUfCBclkhalhu3uGxkbyCsYzYqXxlcxHS8uXB2lrBsU7F8r2flxdb8D6HyhHc67wRMZPKw1jzQNI7Rjsgr47mCVjRaSsphfFDII2rcwFdkiiPPemK7oJd5auPO7A==</Encrypted>]]>
        &Select;
        &CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGaffhFCfMp2dfQyZq1/JNRw654z7af8L3vW/zXCSbft1I6ZDTTKopxYCH8/H73+ZKm8eMo1aJntqqVkKI0DefG3cuVau0N2G1zDKD26MhJ8g1IXzc6C+LURLgSpMVnLMfBmw==</Encrypted>]]>&Message;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafYUXJAlGemm1gnrAgC64oMB2S2yqKTqDWy4RZXsvN52vLISR1gM/JIM2MQHgucKuxQ==</Encrypted>]]>
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
        &CommandInitFieldDeclare;<![CDATA[<Encrypted>&acAvyhSfBG0k0zms0j7pDA3A9+VKZnSFZ1X8IuHjtU0=</Encrypted>]]>&Declare;
        &CommandInitFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0/rVlMCAcN3xyduceVgc9V7ZNEvsUPEFtK6SA6FjMk7gq1Uh5y/Viv/fOUvV1I5r4v/0/5dGfR04AmkSOklqLV8Z78CYGLoYjTxIYICjsUDf</Encrypted>]]>
        &CommandInitFieldSet;
        &Select;
        &CommandInitFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0+b9G3LO07XmNhmP7TybPSb3XkpjdrvZX9Cg97Mnd1cqy1O/HxvZe+N7IWBakT795zrShAac2gFrDN6aAU0VyFfjj7VAKUTbTiFmsv97YACR</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8mJm5Vb1x71eycXG/ZmH/gBbYPMx6ZFufEjwk54q98ftLWvd+6+Am+tot4JfvYCqvMK5hnJQgWRF88OnKQbDw4ZHDKin/ObMphyARCLxbLKP2QmqvMWQjccvPo/Gtvvt/G8rdApsThgeaHB1x7JeVpdcyeQoPN8FbRwgDKSsp235v9JU8PE4ebMM5I8wtuhmj+fPpNyM5bH87ViIuNbLJMZOQgLmgRzTpz2v3DERTyhhVnot3mGNKBYIuiXz/numrUsOOqlJN82PdRMgT3bi9vrFWEhkvIGDqhIk2EvkJf/</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0un305Y/LAluoWdIoq1JKB0vhqW1O36XtJNBKBSU9p98deudKXMsCieQQp258PopbGaRXUec58m1WmkuWFGH7VUl2OAyK/ssBD8bIQ5G5ms/unghdh+btY/qNku6ze5TuaWMScvJh3pFVPfpcShM6fBbyY3IvCx/F7A6RHVlK/jR9bZy3vsWlyc3UOpL4mDDKY8coXN/ho4csZq5FAT+EfhCPXYjt3ZU+/GDlEsmrsW0vnv6g+3Dz3zhNFJTClOUVZvETtPU4RE/WmVItb00jg5yCXapRdREzQIApuXx7FjPXmduoeIdJdbpqgDPy06EBc7I8wmO3+SdpfbhWO7I++s2d14Vef1V+n3O0FCIpWdI3Xe+qGN+UtR7WWpAgR711KZo8iKIXmZOEszod7OZl9Cypf9NeR9LkcP3WMq78Krqv4EbM3KyctnH8tJZ2PX3Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFCAY70b+BwK9cGzeIAe1gppeFcufBlu4OPcP6nSD9aXbkDS99fg5kbogPYv6cPKLw==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22e9HgLYw7ev27/QFFqeGosDrIW39nXpuU6iB/1L6ehzf9/tW4JE4Yj6eff94Ky/pPoFtF1CKyakjxF7+41JxQzYcz+h1/DLhBDmEqsEIfOd/cJ1gCww1n67eS3fkZ7NunmKDW+1FS/3qX6bhoFQ+4QFx5Q23fytaaMt3BPcgHACPwrvwsmdPverLh4zca7yChgLyhX576j/T57iAZpsTU2NPcHi0CdWA/huYtwcKDKCjFCpnTpaXeRpARPCKvfnJJDe+63c2VM4WFt82hiUmV3YcsUCwl5drXFHJLNZx8Y8217inUP/S39rpr1oLLHZoxUINktbzEiFsdcnD0sDpaKlfFqAEXh8Hn8fWRu++jKnKIdgpeJ395ucAJT25nexoHvT1qLnwOgDVXTAwT3u2+ruPriEfnJypfGdq8hhIPj9gsSPPCgrKRMyu+ixcbbXvP2R2o6RhYjOqtoy/hF3doBqJntoChbNQbQs637A/HdAO</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22e9HgLYw7ev27/QFFqeGosDrIW39nXpuU6iB/1L6ehzfE6Ir6PnkLw9Azkgp5N1HEfM9ULwthlFgo8ZuG0XB9/EbruVF90YHJAods6YKh0bIsNArUt0OGxRGiEC2r4fEP1hEmkWKMb7abQT5CmX0IBgYZ8C+1oJF9nTqBhFURtX2yTh6GwOBetDnN1Qd0MCH4WizLOr5KprfNjHOt5a/kvi77OWl5wjm9VCT/I05DbVX</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwG9uTGuU2sWumGBBM/kg5CFIlDtocJl4Xed+cI2TuUN/2ThhWH+4sAZCjBTOYBT9Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4Q9TSpeTPwRE0Q23Ub/OCFlMlYCiSDNQ7iL3KSu6IVSv33x1GmOEOlGyd0qHMKXUsfu6Ehb2oLjgBAtRZ5NOqRXcZjlYMmRZ/jfsoPIlXv5iQgIwCVyLqC4W+KrCQSRbm2oOsXZd15m+SVpOzDOpjf+gKkJpw/kDcGJiT8ZmLYXSRYg07nwEMEDvnW3pQ5Wot8JKYBCHbFptam5w6/mBnpIh4oBHEkowplFmUQeFS3rqD4SkBH13cwa6tv8Qu64HKfvDnmSuQQzebpfdts1/d1GYiYstfkA1rGIJJdyXfK2/uJ/XE2E/hkdc9Ln8jkiOa7it8XxGmhV0ZAeD0ozzThmyLLXzYQzoQOYxHMMwBup6EPTQC8nDwT81Henza3O00MWuxWhpmgD15mv+a8S9N/Gm8gNJANJf42lVDqS7bpIpRoJqXGASZjznfJS0vu7rqf+OZkk9B1OpVSEcaar3rM/a4pla5UaLJvpQsfocHTC9IK+upaTZrtanYcvxejW9SK4zpYwNlaYyd29a4xpBJfKSURoY6/B7kyGbGok/TD54gj2V76lFQCWJDa7LDeY9vYYqdAnOBw1Zvt9S55hjEEBCYmCLeQfJ63NCVc3t8K1KBr5Qp1pDEB5fT0vLLicgk4gDkD7aLfHVBWscEbQLLLMy44rd8fMcqrwuZtFRFl4Bdw9xZ4uXRWmZwGbmx/35sOFh5gG5kko5PsXz1mjLZYl0T4hheqzpgGhjJdG/ihl84CZZxLpShbcp8l8NaCrkJuw0eoQP1CGrcVX4j6GJ4ZDusKSOVIGIKlc/Whq8UTu2T7zUu8JtCmznVKMUmeB71FjA8VUClLZTjXTIAY26cSnpHlOCIMkHGmwbR9Q9cdCDKRGkHv/8TcrLWbBzwH1nSdIFyxS/+M/TtL9srveVAY0/PAu4TC9+qYvih+g5EDl0r+hRqzWqoHW3bhx8j4mEykaTsNTLDMgl2lrMZnlc4z/nxoO4FYi7TjpTwY6MvaWiFx5nLpt/85wNXJzS9mDxu8QQuChrrQCyrHSpeFpxjRKV9YrcJ4xvlAv/nNnYJU/+ob8/pqYlO4zsRc1e1TRHhg==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1Fn5i5cgK+OoKsI1/e8LHLmkz0Dd1Nu5cIHCLQ87ah2DdROGgC8MIz6a4rU0RudXgEdFragvmjnGWghDVT9YTCp85L7OB9+pIgCLlnVylfYhxUn84+nykm1V1GJGll/lT5jMFI6aInv8wQ/tczYgLU2BcSt83i4AWhGyw6aFVb/N27Ei9Nm9mdwbQ3s9ERAvFx6srFmr6Qf/1wWIPPFIwvBK</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfSa1IxpD6U1KaHDg5H0md/Fi3dDehPb2DB3jqtuiXCOm0ETcH+Rv2fDqY9yuf6kvigfzxIZShSvVQ3KGMG09wPefHBiVD6ivpHVJ9o43x2xYjC9pTAkrvprffxXQYX3lGL3ntAKvv+yJg4N/h9u2A3KIMHbcKvJZo1+FsQQZYt8kYhZdFpoVe6vdR2I0VytgFB2BUAIyZ9uo0vm3Hr1db4REiMmzZLRBuYM1se+Jq4qAio6AFeyuF6tyoEv7AuEALQSivxo7UZPpJuVstNXPxr8rBishvuGjkx8vMJCCOIBk=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezkk+4FDGcFG+pSaulBdnrgO9t177GIyhABKy7oaFL/c5qfIReI2wH50yxyCnB8Hh/jts/gjFSO3dmCyB9HE2fkGDgYuVAd9y6IxnRGqGozks9NGi/1KPpQ09A0XzQJ2eGjeqrktgtC/kQj1QyIBtTXe+AjVdE6ax/Zp49cehTe40SzZ1DCGWXKSU4UdoRM+Fa</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+45d73hsHaY0UF8NnB2EOmYFExZTdR+X/cVMhU1MQNFSJeiaBT6LQuNUKnOWA4fNZC4gjckbtuusZ3CDVWtbFaVk=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHL5y32aP3/++55DErbf4U3HrbA6JiUrLcdmnNEmJcWJ/5NsNFTGX86PDdqefgtib7L7DDIt/PLv3NfzAV2l+xvHoIXnXDKfpkhdlt09twAqzmvhZvKf27UrHQui9+jDFOXxxf5WiPm8figuHSD7cGvw4zLJmuYZAe3016tSYxdJ+g==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgPI6G//d3xSgrfyqkXgpMALAyC2ppln+1OxMNlirTDI5nKMqqJKkVghVW8oPzBzrmQZOpUmuq/Q2TiUHZ4tgDWWFiU842Ppvu9LSbc1J3F/MutcrfDAfu0rCKEMp7+Hdvr2EF2qsgCATg960Kx9n786iwYcKchQuvELNV8qr7MYKIB7JCy7xYttAAEB9HDnVN/npxUybIr27u1r3jkyvzutc3/M3ai8vkZNodjZAn+zLvVx65Z8WWAArdouwRUaa/A6/SQVY7zzRZ7jO0C4SJAng4VyC0TGpRM0pbIrMRZjCgshBk8IGDrrWCa+A77B+Cn6EbOJXE8AhozhKKoFiyhJ2BBnly5o9+0X03bk0UHHSiXxC1+W7GS0rscH15jAPJnWdbAOmg2H2K9vTbo39QzKKIkFffVku5Bs8YsEehAB5xBpCH2kOPGXtQmIm6w/+RNM+p1KqvCctc7EwPTLlmskv7F0X6d/9g6JylN9dJHcKfRsW/ZqMXD4HI9U9AKdXsASumcUy7zvCnlOQ5egj8+n74JFWMm2QWttsJWoC4/5IJAtzFCkcyOCRSz0Kv/kafMj8/ygtfOs3oSchtw7Ru7</Encrypted>]]>
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