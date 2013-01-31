# encoding: utf-8

require_relative 'geography'

module Bluebook
  module Abbreviation
    public

    def self.federal_court(c)
      court(c, TABLE_1[:federal], T7_FEDERAL)
    end

    def self.state_court(c)
      court(c, [], T7_STATE)
    end

    def self.english_court(c)
      court(c, [], T7_ENGLISH)
    end

    private

    def self.court(c, defined, additional_abbrevs)
      # One of the given abbreviations
      if abbrev = defined[c]
        abbrev
      # Compose an abbreviation
      else
        # Abbreviate geographic names
        places = TABLE_10.reduce(c) do |mem, pair|
          from, to = pair
          from, to = pair
          mem.gsub(/\b#{from}\b/, to)
        end

        # Table 7 defines some abbreviations for strict substrings of
        # other abbreviations, like "Ct." for "Court" and in "Super.
        #
        # Hashes being unordered by nature, Hash#reduce won't guarantee
        # that longer abbreviations are applied before shorter ones.
        # Thus the Hash is converted into an Array of key-value
        # (text-replacement) pairs that are sorted longest-first, and
        # only then applied.
        
        # Combine generic T7 with the additional abbreviations
        # specific to the jurisdiction.
        t7 = TABLE_7.merge(additional_abbrevs)

        # Convert the combined abbreviation table to an array and sort
        # it by length of text to be replaced.
        replacements = t7.to_a.sort do |a, b|
          b[0].length <=> a[0].length
        end

        # Replace terms with abbreviations
        replacements.reduce(places) do |mem, pair|
          from, to = pair
          mem.gsub(/\b#{from}\b/, to)
        end.gsub('of','').gsub(/\s+/, ' ').strip
      end
    end

    public

    TABLE_1 = {
      :federal => {
        'Supreme Court' => 'U.S',
        # Circuit Courts of Appeals
        'United States Court of Appeals for the First Circuit' => 
          '1st Cir.',
        'Court of Appeals for the First Circuit' => '1st Cir.',
        'First Circuit' => '1st Cir.',
        'United States Court of Appeals for the Second Circuit' => 
          '2d Cir.',
        'Court of Appeals for the Second Circuit' => '2d Cir.',
        'Second Circuit' => '2d Cir.',
        'United States Court of Appeals for the Third Circuit' => 
          '3d Cir.',
        'Court of Appeals for the Third Circuit' => '3d Cir.',
        'Third Circuit' => '3d Cir.',
        'United States Court of Appeals for the Fourth Circuit' => 
          '4th Cir.',
        'Court of Appeals for the Fourth Circuit' => '4th Cir.',
        'Fourth Circuit' => '4th Cir.',
        'United States Court of Appeals for the Fifth Circuit' => 
          '5th Cir.',
        'Court of Appeals for the Fifth Circuit' => '5th Cir.',
        'Fifth Circuit' => '5th Cir.',
        'United States Court of Appeals for the Sixth Circuit' => 
          '6th Cir.',
        'Court of Appeals for the Sixth Circuit' => '6th Cir.',
        'Sixth Circuit' => '6th Cir.',
        'United States Court of Appeals for the Seventh Circuit' => 
          '7th Cir.',
        'Court of Appeals for the Seventh Circuit' => '7th Cir.',
        'Seventh Circuit' => '7th Cir.',
        'United States Court of Appeals for the Eighth Circuit' => 
          '8th Cir.',
        'Court of Appeals for the Eighth Circuit' => '8th Cir.',
        'Eighth Circuit' => '8th Cir.',
        'United States Court of Appeals for the Ninth Circuit' => 
          '9th Cir.',
        'Court of Appeals for the Ninth Circuit' => '9th Cir.',
        'Ninth Circuit' => '9th Cir.',
        'United States Court of Appeals for the Tenth Circuit' => 
          '10th Cir.',
        'Court of Appeals for the Tenth Circuit' => '10th Cir.',
        'Tenth Circuit' => '10th Cir.',
        'United States Court of Appeals for the District of Columbia' =>
          'D.C. Cir.',
        'Court of Appeals for the District of Columbia' => 
          'D.C. Cir.',
        'United States Court of Appeals for the Federal Circuit' => 
          'Fed. Cir.',
        'Court of Appeals for the Federal Circuit' => 'Fed. Cir.',
        'Federal Circuit' => 'Fed. Cir.',
        # Other Courts
        'Temporary Emergency Court of Appeals' => 'Temp. Emer. Ct. App.',
        'Emergency Court of Appeals' => 'Emer. Ct. App.',
        'Commerce Court' => 'Comm. Ct.',
        'United States Court of Customs and Patent Appeals' => 'C.C.P.A.',
        'Court of Customs Appeals' => 'Ct. Cust. App.',
        'Court of Claims' => 'Ct. Cl.',
        'United States Court of Federal Claims' => 'Fed. Cl.',
        'United States Claims Court' => 'Cl. Ct.',
        'Court of Claims' => 'Ct. Cl.',
        'United States Court of International Trade' => 'Ct. Int’l Trade',
        'United States Customs Court' => 'Cust. Ct.',
        'Judicial Panel on Multidistrict Litigation' => 'J.P.M.L.',
        'Special Court, Regional Rail Reorganization Act' =>
          'Reg’l Rail Reorg. Ct.',
        # Tax
        'Tax Court' => 'T.C.',
        'Board of Tax Appeals' => 'B.T.A.',
        # Military
        'United States Court of Appeals for Veterans Claims' =>
          'Vet. App.',
        'United States Court of Veterans Appeals' => 'Vet. App.',
        'United States Court of Appeals for the Armed Forces' =>
          'C.A.A.F.',
        'United States Court of Military Appeals' => 'C.M.A.',
        'Army Court of Criminal Appeals' => 'A. Ct. Crim. App.',
        'Air Force Court of Criminal Appeals' => 'A.F. Ct. Crim. App.',
        'Coast Guard Court of Criminal Appeals' => 'C.G. Ct. Crim. App.',
        'Navy-Marine Corps Court of Cirminal Appeals' =>
          'N-M. Ct. Crim. App.',
        'Army Court of Military Review' => 'A.C.M.R.',
        'Army Board of Review' => 'A.B.R',
        'Air Force Court of Military Review' => 'A.F.C.M.R.',
        'Air Force Board of Review' => 'A.F.B.R',
        'Coast Guard Court of Military Review' => 'A.F.C.M.R.',
        'Coast Guard Board of Review' => 'A.F.B.R',
        'Navy-Marine Corps Court of Military Review' => 'A.F.C.M.R.',
        'Navy-Marine Corps Board of Review' => 'A.F.B.R'
      },
      :state => {
        # TODO: State court abbreviations
      }
    }

    TABLE_2 = {
    }

    EXAMPLE_COURTS = {
      'Judicial Panel on Multidistrict Litigation' => 'J.P.M.L.',
      'Foreign Intelligence Surveillance Court' => 'FISA',
      'Foreign Intelligence Surveillance Court of Review' => 
        'FISA Ct. Rev.'
    }

    COURTS = TABLE_1.merge(TABLE_2)

    TABLE_7 = {
      'Administrative Court' => 'Admin. Ct.',
      'Admiralty Division' => 'Adm.',
      'Admiralty Court' => 'Adm.',
      'Aldermen’s Court' => 'Alder. Ct.',
      'Appeals Court' => 'App. Ct.',
      'Appellate Court' => 'App. Ct.',
      'Appellate Department' => 'App. Dep’t',
      'Appellate Division' => 'App. Div.',
      'Armed Services Board of Contract Appeals' => 'ASBCA',
      'Bankruptcy Appellate Panel' => 'B.A.P.',
      'Bankruptcy Judge' => 'Bankr.',
      'Bankruptcy Court' => 'Bankr.',
      'Board of Contract Appeals' => 'B.C.A.',
      'Board of Immigration Appeals' => 'B.I.A.',
      'Board of Patent Appeals and Interferences' => 'B.P.A.I.',
      'Board of Tax Appeals' => 'B.T.A.',
      'Borough Court' => 'Bor. Ct.',
      'Central District' => 'C.D.',
      'Chancery Court' => 'Ch.',
      'Chancery Division' => 'Ch.',
      'Children’s Court' => 'Child. Ct.',
      'City Court' => 'City Ct.',
      'Civil Appeals' => 'Civ. App.',
      'Civil Court of Record' => 'Civ. Ct. Rec.',
      'Civil District Court' => 'Civ. Dist. Ct.',
      'Claims Court' => 'Cl. Ct.',
      'Commerce Court' => 'Comm. Ct.',
      'Commission' => 'Comm’n',
      'Common Pleas' => 'C.P. <when appropriate, name county or similar subdivision>',
      'Commonwealth Court' => 'Commw. Ct.',
      'Conciliation Court' => 'Concil. Ct.',
      'County Court' => 'Cnty. Ct.',
      'County Judge’s Court' => 'Cnty. J. Ct.',
      'Court' => 'Ct.',
      'Court of Appeals for the Armed Forces' => 'C.A.A.F.',
      'Court of Civil Appeals' => 'Civ. App.',
      'Court of Claims' => 'Ct. Cl.',
      'Court of Common Pleas' => 'Ct. Com. Pl.',
      'Court of Criminal Appeals' => 'Crim. App.',
      'Court of Customs and Patent Appeals' => 'C.C.P.A.',
      'Court of Customs Appeals' => 'Ct. Cust. App.',
      'Court of Errors' => 'Ct. Err.',
      'Court of Errors and Appeals' => 'Ct. Err. & App.',
      'Court of Federal Claims' => 'Fed. Cl.',
      'Court of General Sessions' => 'Ct. Gen. Sess.',
      'Court of Special Sessions' => 'Ct. Spec. Sess.',
      'Court of International Trade' => 'Ct. Int’l Trade',
      'Court of Military Appeals' => 'C.M.A.',
      'Court of Military Review' => 'C.M.R.',
      'Court of Special Appeals' => 'Ct. Spec. App.',
      'Court of Veterans Appeals' => 'Ct. Vet. App.',
      'Criminal Appeals' => 'Crim. App.',
      'Criminal District Court' => 'Crim. Dist. Ct.',
      'Customs Court' => 'Cust. Ct.',
      'District Court of Appeal' => 'Dist. Ct. App.',
      'District Court of Appeals' => 'Dist. Ct. App.',
      'Division' => 'Div.',
      'Domestic Relations Court' => 'Dom. Rel. Ct.',
      'Eastern District' => 'E.D.',
      'Emergency Court of Appeals' => 'Emer. Ct. App.',
      'Equity Division' => 'Eq.',
      'Equity Court' => 'Eq.',
      'Family Court' => 'Fam. Ct.',
      'High Court' => 'High Ct.',
      'Judicial District' => 'Jud. Dist.',
      'Judicial Division' => 'Jud. Div.',
      'Judicial Panel on Multidistrict Litigation' => 'J.P.M.L.',
      'Justice of the Peace’s Court' => 'J.P. Ct.',
      'Juvenile Court' => 'Juv. Ct.',
      'Land Court' => 'Land Ct.',
      'Law Court' => 'Law Ct.',
      'Law Division' => 'Law Div.',
      'Magistrate Division' => 'Magis. Div.',
      'Magistrate’s Court' => 'Magis. Ct.',
      'Middle District' => 'M.D.',
      'Municipal Court' => 'Mun. Ct.',
      'Northern District' => 'N.D.',
      'Orphans’ Court' => 'Orphans’ Ct.',
      'Parish Court' => 'Parish Ct.',
      'Police Justice’s Court' => 'Police J. Ct.',
      'Prerogative Court' => 'Prerog. Ct.',
      'Probate Court' => 'Prob. Ct.',
      'Public Utilities Commission' => 'P.U.C.',
      'Real Estate Commission' => 'Real Est. Comm’n',
      'Recorder’s Court' => 'Rec’s Ct.',
      'Southern District' => 'S.D.',
      'Special Court Regional Rail Reorganization Act' => 'Reg’l Rail Reorg. Ct.',
      'Superior Court' => 'Super. Ct.',
      'Supreme Court, Appellate Division' => 'App. Div.',
      'Supreme Court, Appellate Term' => 'App. Term',
      'Supreme Court of Errors' => 'Sup. Ct. Err.',
      'Supreme Judicial Court' => 'Sup. Jud. Ct.',
      'Surrogate’s Court' => 'Sur. Ct.',
      'Tax Appeal Court' => 'Tax App. Ct.',
      'Tax Court' => 'T.C.',
      'Teen Court' => 'Teen Ct.',
      'Temporary Emergency Court of Appeals' => 'Temp. Emer. Ct. App.',
      'Territory' => 'Terr.',
      'Territorial' => 'Terr.',
      'Trademark Trial and Appeal Board' => 'T.T.A.B.',
      'Traffic Court' => 'Traffic Ct.',
      'Tribal Court' => 'Tribal Ct.',
      'Tribunal' => 'Trib.',
      'Water Court' => 'Water Ct.',
      'Western District' => 'W.D.',
      'Workmen’s Compensation Division' => 'Workmen’s Comp. Div.',
      'Youth Court' => 'Youth Ct.'
    }

    T7_FEDERAL = {
      # 'Circuit Court (old federal)' => 'C.C.',
      'Circuit Court of Appeals' => 'Cir.',
      'Court of Appeals' => 'Cir.',
      'District Court' => 'D.',
      'Supreme Court' => 'U.S.'
    }

    T7_STATE = {
      'Circuit Court' => 'Cir. Ct.',
      'Circuit Court of Appeals' => 'Cir. Ct. App.',
      'Court of Appeal' => 'Ct. App.',
      'Court of Appeals' => 'Ct. App.',
      'District Court' => 'Dist. Ct.',
      'Supreme Court' => 'Sup. Ct.'
    }

    T7_ENGLISH = {
      'Court of Appeal' => 'C.A.',
      'Supreme Court' => 'Sup. Ct.'
    }
  end
end
