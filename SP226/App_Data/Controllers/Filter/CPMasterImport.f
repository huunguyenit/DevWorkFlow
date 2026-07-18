<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "CPMasterImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ImportVoucherScript SYSTEM "..\Include\Javascript\ImportVoucher.txt">
  <!ENTITY ImportVoucherCommand "init$&Identity;$Status(this,' + isnull((select top 1 m_status from dmct where ma_ct = @@id), '0') + ');">

  <!ENTITY % PaymentApproval SYSTEM "..\Include\PaymentApproval.ent">
  %PaymentApproval;
]>

<dir table="m56$000000" code="stt_rec" order="ngay_ct, so_ct" id="BN1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="status" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 50, 50, 100, 100, 30, 0"/>
      <item value="110000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
      <item value="1100: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        &APVHiddenImportStatus;
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHN1GSsozC3W9y8ZZfl+gb88srNhfWfSmWqcvCRR7c8tQ554J/eiIcQgJbyV15/n1Q==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuoW605fJ//Tjq0tNlkpYjCg=</Encrypted>]]>&APVImportVoucherCommand;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ1z/ThtRrQvtD50PZb3Ml73IJbgoKvHjAm8DFcU0JDe+</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKaBUrspbPJs/UZF6A52n6B9qb9EXsh+IKi8uYanRXhzxkt+nwaAIIOO54f6eIeRtYC1gJtTX1OQVkh00meUCo6dzmk/bRPBEg8mKhSlSZg/8sBGopZqpckmIOeyiD8sg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3pzmE5chSLTUsRU/oQi8qvIvTBRzoIephrRkZtXbFyoIrBELwMw5+m6gUxWzpcVL2LHh/Sf1f1lPH0Mj8Cye+hD09y4FXRK7ap20f9QmL5AO810cPdM2uWBYyrwSvlS82/xE2g4u3L2w2Ymt+UsTCJ1YC+JC9A75+/qZ9F3aMcTTQ4Hy9V/Yqa5WTNlSYRsDJEs2K/jwlz58xleu43D8MVndr0nz82BpyLXglSLy9zKHvjv5WL4Jmlt1fqCB1oQLPLvEgaOC0DqmR544CSoUSrxrCh/9zxaqENYSH3SAOFyYcWBquKvYi+9o+BVxtjvB52l2E9365HF0xX0lREpSuGybNMUyWTQndoC+68K2xcnzFshCQV/lvIuqPyC3+Uf1Rg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&C2oX7For6o4fC973pcIHerI7sYVqKnI39vVnRnKcMkf5ySi6ppSEniucc+cmAaKihQS+DQAZzM/SSBT+5BEX1QQA3CLgBIigLux3wyaAfR0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&40Tg4Lrc/5UuRfmdgw9mHE2LfCeI0QcWQ2XR/cdsKh8x1Y4EaRBonIR1PeXeDmz2gdLed3VBEbJ2kH/Ed57gdMeYZjOKeQv2hnzAQMBfM7yfvK8BwOPj5wIgm6iSBWt9JCYgxe4qzcFF56jQzSlxUygoNAQKEh+FzvAl+2ZxNr8tDYtIRinEP1Uv1Rpto+IrBGZQX6rE3lKbcGLne+PWBNkKjqabB1kTMC08A3FmCV5Tc4kvPC0J/TPbNsNvaPJiFx4Vh2kTg2qdR/dUqZ9JkiSe5OJhKD3dpBhQk1zTCCHRDYavg9LOXOybPqRBUW9l+YwvRcCb5mR1O6zc0c2b8bJjztkfoAwNTb0TJ7T5iy8AOcTHvHEY2MgxTHEa70PbQKxz1tqCOMLj4HgrEXwemxMFJXrsHlOxys7l9Qm4hbZADPuoFoeQCAJJLG/pD4bsp5y4QTft6HiiFCYGVMgz2C142TuXhwtEkYwBZmi60hCwukfFaP+9uPsgKdV0+fFnETXOP8zmBUg2VESl2mSjGwxUq4Faul+4LPzPeq58DRatC+U0LOvZ9Et+SaZfTLSa</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &UploadScript;
      &ImportVoucherScript;
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>